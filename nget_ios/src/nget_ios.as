package
{
	import core.Launcher;
	import core.PreLauncher;
	
	import gametheater.gt;
	import gametheater.gtIOSApp;
	import gametheater.plugins.console.gtConsolePlugin;
	
	[SWF(width="640", height="960", backgroundColor='#ffffff',frameRate='60')]
	public class nget_ios extends gtIOSApp
	{
		public function onSetup():void
		{
			gt.create(PreLauncher);

			loadPlugin(gtConsolePlugin);
			expire("10/31/2014");
			
			
			//			QClue.BUILD_TAG = "0.1.5";
			//			loadPlugin(gtQClue,"4~XP3>ZL3+Lz-((5wb,s");
			//			gt.shout("report",0,{tesing:"123"});
			
			//			loadPlugin(gtAppRater);
			//			loadPlugin(gtEasyPush);
			
			//			loadPlugin(clTechBackbonePlugin);
		}
		
		public function onLaunch():void
		{
			gt.create(Launcher);
		}
	}
}