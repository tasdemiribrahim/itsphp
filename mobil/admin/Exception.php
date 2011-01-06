<?php
class DebugException extends Exception
{
	const PLAIN = 0;
	const HTML = 1;
	public static $sourceCodeSpan= 10;
	public static $outputFormat= self::HTML;
	public static $errorScope= E_ALL;
	protected $addedDebug= array();

	public function __construct($message, $code = 0)
	{
		// make sure everything is assigned properly
		parent::__construct($message, $code);
		// additional debug info?
		if (func_num_args() > 2) 
			$this->addedDebug = array_slice(func_get_args(), 2);
	}

	public function __destruct()
	{
		// intentionally left blank
	}

	// to be called statically once to handle all exceptions & errors
	public static function init()
	{
		// handle all exceptions with this class
		// set_exception_handler(array('DebugException','exceptionHandler'));
		// handle all errors with this class
		set_error_handler(array('DebugException', 'errorHandler'),self::$errorScope);
		ob_start('olumculHataYakalayici');
		//auto-detect / guess the output format
		if (php_sapi_name() == 'cli') 
			self::$outputFormat = self::PLAIN;
		else 
			self::$outputFormat = self::HTML;
	}

	// unregister error and exception handlers
	public static function unInit()
	{
		// pop exception handler stack
		restore_exception_handler();
		// pop error handler stack
		restore_error_handler();
	}
	/**
	* Saves errors to the "/error/hata.log" file and turn errors into DebugExceptions
	*
	* @param int $errno
	* @param string $errmsg
	* @param string $filename
	* @param int $linenum
	* @param array $vars
	*/
	public static function errorHandler($number,$message,$file,$line,$context)
	{
		$errortype = array (
		        E_ERROR             	=> 'Error',
		        E_WARNING            	=> 'Warning',
		        E_PARSE              	=> 'Parsing Error',
		        E_NOTICE            	=> 'Notice',
		        E_CORE_ERROR         	=> 'Core Error',
		        E_CORE_WARNING       	=> 'Core Warning',
		        E_COMPILE_ERROR      	=> 'Compile Error',
		        E_COMPILE_WARNING    	=> 'Compile Warning',
		        E_USER_ERROR         	=> 'User Error',
		        E_USER_WARNING       	=> 'User Warning',
		        E_USER_NOTICE        	=> 'User Notice',
		        E_STRICT             	=> 'Runtime Notice',
			E_FATAL			=> 'Fatal Error',
		        E_RECOVERABLE_ERROR  	=> 'Catchable Fatal Error'
		        );
	
	   	$user_errors = array(E_USER_ERROR, E_USER_WARNING, E_USER_NOTICE);
		//if(strpos($filename,SCRIPT_PATH)!==0)					// Dis hatalar atlanir
		//	return;	
		$file = basename($file);
		$errMesaj="$errortype[$number]:$file:$line:$message";
		if (in_array($number, $user_errors))
			$errMesaj .= serialize($context);
		$errMesaj .=PHP_EOL;
		$fp = fopen($_SERVER['DOCUMENT_ROOT']."/error/hata.log", "a+");
		flock($fp, LOCK_EX);
		while(!feof($fp))
		{
			$satir=fgets($fp);
			if(0 == strcmp($satir,$errMesaj))
			{
				flock($fp, LOCK_UN);
				fclose($fp);
				return;
			}
		}
		fwrite($fp,$errMesaj);
	    	flock($fp, LOCK_UN);
		fclose($fp);
		// convert error to excepton and throw it
		$debugException = new DebugException($number, 0, $context);
		// transfer info to DebugException
		$debugException->file = $file;
		$debugException->line = $line;
		// throw the new DebugException
		throw $debugException;
	}
	/**
	* Saves fatal errors
	*
	* @param string $bufferContent
	*/
	function olumculHataYakalayici($bufferContent)
	{
		$output     = $bufferContent;
		$matches    = array();
		$errors     = "";
		$var=null;
		if ( preg_match('|<phphata>.*</phphata>|s', $output, &$matches) )
		{
			foreach ($matches as $match)
				$errors .= strip_tags($match) . "\n\n---\n\n";
			$var = hataYakalayici('efatal', 'Fatal Error', 'unknown', 'unknown', $errors);
			$filename = $_SERVER['DOCUMENT_ROOT']."/error/Error.php?err=500";
			$handle = fopen($filename, "r");
			$contents = fread($handle, filesize($filename));
			fclose($handle);
			$output =  $contents;
		}
		return $var;
	}
	// catching regular exceptions
	public static function exceptionHandler($exception)
	{
		// explicitly call this class's __toString()
		self::output($exception);
	}
	// collects & outputs the debug info
	public static function output(Exception $exception)
	{
		$output = array();
		// output file name and line number
		$output[] = array('Summary:', 'An exception occurred in file' . basename($exception->getFile()). ' on line ' .$exception->getLine() . '.');
		// output message
		$output[] = array('Error message: ', $exception->getMessage());
		// get source code of file that threw exception
		$sourceExcerpt = self::getSourceExcerpt($exception->getFile(), $exception->getLine());
		$output[] = 'Source code excerpt of lines ' .$sourceExcerpt['start']. ' through ' . $sourceExcerpt['end'] . ' of file' . $exception->getFile() . ':';
		// highlight syntax for HTML output
		if (self::$outputFormat == self::HTML) 
			$output[] = array('', highlight_string(implode('',$sourceExcerpt['source']), TRUE));
		elseif (self::$outputFormat == self::PLAIN) 
			$output[] = implode('', $sourceExcerpt['source']);
		// get backtrace nicely formatted
		$formattedTraces = self::getFormattedTrace($exception);
		// get additionally debug info nicely formatted
		$output = array_merge($output,self::getFormattedDebugInfo($exception));
		// format output depending on how $outputFormat is set
		// output HTML first
		if (self::$outputFormat == self::HTML) 
		{
			// have a show/hide link for each trace
			for ($i = 0; $i < sizeof($formattedTraces); $i++) 
			{
				$output[] = '<a href="" onclick="var bt = document.getElementById(\'backtrace' . ($i + 1) . '\');if (bt.style.display ==\'\') bt.style.display = \'none\';else bt.style.display = \'\';return false;">Backtrace step ' . ($i + 1) . ' (click to toggle):</a>';
				$output[] = self::arrayToTable($formattedTraces[$i],'backtrace' . ($i + 1));
			}
			echo self::arrayToTable($output, null, 'Debug Output',FALSE);
			// output plain text
		} 
		elseif (self::$outputFormat == self::PLAIN) 
		{
			// merge traces into output array
			$output = array_merge($output, $formattedTraces);
			// flatten the multi-dimensional array(s) for simple outputting
			$flattenedOutput = self::flattenArray($output);
			echo implode(PHP_EOL, $flattenedOutput);
		}
	}
	// extracts +/- $sourceCodeSpan lines from line $line of file $file
	public static function getSourceExcerpt($file, $line)
	{
		// get source code of file that threw exception
		$source = file($file);
		// limit source code listing to +/- $sourceCodeSpan lines
		$startLine = max(0, $line - self::$sourceCodeSpan - 1);
		$offset = min(2 * self::$sourceCodeSpan + 1, count($source) -$line + self::$sourceCodeSpan + 1);
		$sourceExcerpt = array_slice($source, $startLine, $offset);
		if ($startLine > 0) 
			array_unshift($sourceExcerpt, "<?php\n", "// ...\n");
		// return source excerpt and start/end lines 
		return array('source' =>$sourceExcerpt, 'start' =>$startLine,'end'=>$startLine + $offset );
	}
	// creates array containing formatted backtrace
	// uses syntax highlighting for source code if
	// $outputFormat is HTML
	public static function getFormattedTrace(Exception $exception)
	{
		// init output array of formatted traces
		$formattedTraces = array();
		// get traces from exception
		$traces = $exception->getTrace();
		// init counter
		$count = 1;
		// iterate over traces
		foreach ($traces as $aTrace) 
		{
			// skip the method where we turned an error into an Exception
			if ($aTrace['function'] != 'errorHandler') 
			{
				// init output for this trace
				$output = array();
				$output[] = "Backtrace step $count:";
				// output class if given
				if (array_key_exists('class', $aTrace)) 
					$output[] = array('Class: ', $aTrace['class']);
				// output type if given
				if (array_key_exists('type', $aTrace)) 
					$output[] = array('Type: ', $aTrace['type']);
				// output function if given
				if (array_key_exists('function', $aTrace)) 
				{
					$output[] = array('Function: ',	$aTrace['function']);
					// output argument to function
					if (array_key_exists('args', $aTrace)) 
					$output[] = array('', 'with argument(s): ' .implode(', ', $aTrace['args']));
				}
				// get source code of file that threw exception
				$sourceExcerpt =self::getSourceExcerpt($aTrace['file'], $aTrace['line']);
				$output[] = 'Source code excerpt of lines ' .$sourceExcerpt['start']. ' through ' . $sourceExcerpt['end'] . 'of file ' . $aTrace['file'] . ':';
				// highlight syntax for HTML output
				if (self::$outputFormat == self::HTML) 
					$output[] = array('', highlight_string(implode('',$sourceExcerpt['source']), TRUE));
				elseif (self::$outputFormat == self::PLAIN) 
					$output[] = implode('', $sourceExcerpt['source']);
				$formattedTraces[] = $output;
				// increase step counter
				$count++;
			}
		}
		return $formattedTraces;
	}
	// formats the variables & objects passed to the constructor
	// and stored in $addedDebug. Uses syntax highlighting for
	// source code if $outputFormat is HTML
	public static function getFormattedDebugInfo(Exception	$exception)
	{
		// init output array
		$output = array();
		// only the DebugException class has the addedDebug property
		if (get_class($exception) == __CLASS__) 
		{
			if (count($exception->addedDebug) > 0) 
				$output[] = 'Additional debug info:';
			// iterate over each variable
			foreach ($exception->addedDebug as $addBug) 
				foreach ($addBug as $debugLabel => $debugVar) 
				{
					// format with print_r
					if (self::$outputFormat == self::HTML) 
						$output[] = array($debugLabel, '<pre>' .print_r($debugVar, TRUE) . '</pre>');
					elseif (self::$outputFormat == self::PLAIN) 
						$output[] = array($debugLabel,print_r($debugVar, TRUE));
				}
		}
		return $output;
	}
	// converts an array of items to output to an HTML table
	// expects format:
	//	array('some text here', 	<- single cell on row 1
	//	array('label', $value),	<- two cells on row 2
	//		(label and value)
	//	.);
	public static function arrayToTable(array $contents = array(),$id = null,$caption = null,$hideByDefault = TRUE)
	{
		$html = '';
		// open table tag
		if (count($contents) > 0) 
		{
			$html .= '<table style="width: 100%;border: 2px solid';
			$html .= ($hideByDefault) ? 'none' : '';
			$html .= ';"';
			$html .= ($id != null) ? " id=\"$id\"" : '';
			$html .= ">\n";
		}
		// add caption
		if (!empty($caption) > 0) 
			$html .= '<caption><h2>' . htmlentities($caption) ."</h2></caption>\n";
		$rowCount = 1;
		$rowColors = array('#fff', '#ccc');
		// iterate over input array
		foreach ($contents as $row) 
		{
			$html .= "<tr style=\"background: " .$rowColors[($rowCount % 2)] . ";\">\n";
			// split arrays into label and field
			if (is_array($row) && count($row) >= 2) 
				$html .= '<td><strong>' . htmlentities($row[0]) ."</strong></td>\n<td>" . $row[1] . "</td>\n";
			else 
				$html .= '<th colspan="2" style="text-align: left;">'. $row . "</th>\n";
			$html .= "</tr>\n";
			$rowCount++;
		}
		// close table tag
		if (count($contents) > 0) 
			$html .= "</table>\n";
		return $html;
	}
	// takes a multi-dimensional array and flattens it for plain text output
	public static function flattenArray(array $inputArray = array())
	{
		$outputArray = array();
		// iterate over input array items
		foreach ($inputArray as $item) 
		{
			// use recursion to traverse the hierarchy
			if (is_array($item)) 
				$outputArray = array_merge($outputArray,self::flattenArray($item));
			else 
				array_push($outputArray, $item);
		}
		return $outputArray;
	}
}
/**  'ExceptionHandler.php'
* The ExceptionHandler class sends uncaught
* exception messages to the proper handlers.  This is done
* using the Observer pattern, and SplObserver/SplSubject.
*/
class ExceptionHandler implements SplSubject
{
    private $observers = array();
    public $exception;
    function __construct() { }
    public function attach(SplObserver $obs)
    {
        $id = spl_object_hash($obs);
        $this->observers[$id] = $obs;
    }
    public function detach(SplObserver $obs)
    {
        $id = spl_object_hash($obs);
        unset($this->observers[$id]);
    }
    public function notify()
    {
        foreach($this->observers as $obs)
            $obs->update($this);
    }
    public function handle(Exception $e)
    {
        $this->exception = $e;
        $this->notify();
    }
}
class Logger implements SplObserver
{
    public function update(SplSubject $subject)
    {
	$errMesaj=$subject->exception.'\n\r';
	$fp = fopen($_SERVER['DOCUMENT_ROOT']."/error/hataEx.log", "a+");
	while(!feof($fp))
	{
		$satir=fgets($fp);
		if(0 == strcmp($satir,$errMesaj))
		{
			fclose($fp);
			return true;
		}
	}
	fwrite($fp,$errMesaj);
	fclose($fp);
	DebugException::output($subject->exception);
	return true;
    }
}
class Mailer implements SplObserver
{
    public function update(SplSubject $subject)
    {
        // Set up mail here
        // ...
    }
}
$handler = new ExceptionHandler();
$handler->attach(new Logger());
//$handler->attach(new Mailer());
set_exception_handler(array($handler, 'handle'));
DebugException::init();
