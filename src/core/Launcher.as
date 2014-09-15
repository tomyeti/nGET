package core
{
	import gametheater.ISingleton;
	import gametheater.gtObject;
	import gametheater.gtScreen;
	import gametheater.core.gtFactory;
	import gametheater.core.gtLayer;
	
	import gui.Button;
	import gui.main.MainScreen;
	
	public class Launcher extends gtObject implements ISingleton
	{
		public function onCreate():void
		{

			create(gtLayer).setup("background", 0).enableInput();
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