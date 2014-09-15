package gui.main
{
	import gametheater.IScript;
	import gametheater.gtObject;
	import gametheater.core.gtClickAction;
	
	public class MainButtonClicked extends gtObject implements IScript
	{
		public function toggleSettings(a:gtClickAction)
		{
			shout("toggleSettings");
		}
	}
}