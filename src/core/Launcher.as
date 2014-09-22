package core
{
	import gametheater.ISingleton;
	import gametheater.gtObject;
	import gametheater.gtScreen;
	import gametheater.core.gtApp;
	import gametheater.core.gtFactory;
	import gametheater.core.gtLayer;
	import gametheater.plugins.starling.gtStarlingPlugin;
	
	import gui.Button;
	import gui.main.MainScreen;
	
	public class Launcher extends gtObject implements ISingleton
	{
		public function onCreate():void
		{
			gtApp.loadPlugin(gtStarlingPlugin);

			create(gtLayer).setup("background", 0).enableInput();
			starlingScene.addLayer("background", 0);
			user.changeScreen(gtScreen, false);			

			create(Blob);
			create(Data);
			
			load.cacheBust = true;
			
			log("Version " + globals.blob.version + " active");
			gtFactory.registerType("Button", Button);

			shout("removePreLauncher");
			log("Launcher");


			user.changeScreen(MainScreen, false);
		}
	}
}