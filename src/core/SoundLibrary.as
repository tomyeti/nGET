package core
{
	import gametheater.IListener;
	import gametheater.ISingleton;
	import gametheater.gtActor;
	import gametheater.core.gtSound;
	
	public class SoundLibrary extends gtActor implements ISingleton, IListener
	{
		public var currentMusic:gtSound;
		
		public function onCreate():void
		{
			makeGlobal("sounds",this);
			
			loadLibrary();
			
			shout("updateSound");
		}
		
		public function onAssetsLoaded():void
		{
			loadLibrary();
		}
		
		public function loadLibrary():void
		{
			
				
			soundLayer("fx");
			soundLayer("music");
		}
		
		listener function stopMusic():void
		{
			if(currentMusic)
			{
				currentMusic.release();
			}
		}
		
		listener function updateSound():void
		{
			if(globals.blob.music)
				soundLayer("music").unMute();
			else
				soundLayer("music").mute();
			
			if(globals.blob.soundEffects)
				soundLayer("fx").unMute();
			else
				soundLayer("fx").mute();
		}
		
		listener function playMusic(s:String,volume:Number = 1):void
		{
			if(currentMusic)
				currentMusic.release();
			
			var temp:gtSound = playSound(s, false, "music");
			
			if(temp)
			{
				link("currentMusic", temp);
				
				if (volume != 1)
					currentMusic.volume = volume;
			}
			else
			{
				logError("Unable to play MUSIC: \"" + s + "\"");
			}
		}
		
		listener function playSound(s:String,volume:Number = 1):void
		{
			var temp:gtSound = playSound(s, false, "fx");
			
			if(temp)
			{
				if (volume != 1)
					temp.volume = volume;
			}
			else
			{
				logError("Unable to play SFX: \"" + s + "\"");
			}
		}
		
		public function onSoundEnd(sound:gtSound):void
		{
			if (sound.layer == "music")
				shout("musicLoop");
		}
		
	}
}