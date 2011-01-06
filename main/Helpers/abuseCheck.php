<?php
class Abuse_Check 
{
	var $sem_key;
	var $shm_key;
	var $shm_size;
	var $recalc_seconds;
	var $pageview_threshold;
	var $sem;
	var $shm;
	var $data;
	var $exclude;
	var $block_message;
	
	function Abuse_Check() 
	{
		$this->sem_key = 5000;
		$this->shm_key = 5001;
		$this->shm_size = 16000;
		$this->recalc_seconds = 60;
		$this->pageview_threshold = 30;
		$this->exclude['/ok-to-bombard.html'] = 1;
		$this->block_message ="<html>
			<head>
		    <META http-equiv=content-type content=text/html;charset=iso-8859-9>
			<META http-equiv=content-type content=text/html;charset=windows-1254>
			<META http-equiv=content-type content=text/html;charset=x-mac-turkish>
			<title>403 Yasaklı</title></head>
			<body>
			<h1>Yasaklı</h1>
			Bu sitenin sayfasını görüntülemeniz hesabınızın tekrarlanan taciz aktiviteleri yüzünden bloke edilmiştir.
			Bir hata olduğunu düşünüyorsanız lütfen site yöneticisiyle görüşünüz:<a href='mailto:tasdemiribrahim@mynet.com?subject=Yasaklı+Site'>tasdemiribrahim@mynet.com</a>.
			</body>
			</html>";
	}
	
	function get_lock() 
	{
		$this->sem = sem_get($this->sem_key,1,0600);
		if (sem_acquire($this->sem)) 
		{
			$this->shm = shm_attach($this->shm_key,$this->shm_size,0600);
			$this->data = shm_get_var($this->shm,'data');
		} 
		else 
		{
			trigger_error("Can't acquire semaphore $this->sem_key");
		}
	}
	
	function release_lock() 
	{
		if (isset($this->data)) 
		{
			shm_put_var($this->shm,'data',$this->data);
		}
		shm_detach($this->shm);
		sem_release($this->sem);
	}
	
	function check_abuse($user) 
	{
		$this->get_lock();
		if ($this->data['abusive_users'][$user]) 
		{
			// if user is on the list release the semaphore & memory
			$this->release_lock();
			// serve the "you are blocked" page
			header('HTTP/1.0 403 Forbidden');
			print $this->block_message;
			return true;
		} 
		else 
		{
			// mark this user looking at a page at this time
			$now = time();
			if (!$this->exclude[$_SERVER['PHP_SELF']]) 
			{
				$this->data['user_traffic'][$user]++;
			}
			// (sometimes) tote up the list and add bad people
			if (! $this->data['traffic_start']) 
			{
				$this->data['traffic_start'] = $now;
			}
			else 
			{
				if (($now - $this->data['traffic_start']) > $this->recalc_seconds) 
				{
					while (list($k,$v) = each($this->data['user_traffic'])) 
					{
						if ($v > $this->pageview_threshold) 
						{
							$this->data['abusive_users'][$k] = $v;
							// log the user's addition to the abusive user list
							trigger_error("Abuse: [$k] (from ".$_SERVER['REMOTE_ADDR'].')');
						}
					}
					$this->data['traffic_start'] = $now;
					$this->data['user_traffic'] = array();
				}
			}
			$this->release_lock();
		}
		return false;
	}
}
