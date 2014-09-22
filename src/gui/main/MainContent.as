package gui.main
{
	import gametheater.IListener;
	import gametheater.gtWidget;
	import gametheater.render.nodes.gtShapeNode;
	import gametheater.render.nodes.gtTextNode;
	
	import gui.Button;
	import gui.SettingsWidget;
	import gui.UserScripts;
	
	public final dynamic class MainContent extends gtWidget implements IListener
	{
		use namespace auto;
		auto var background:gtShapeNode;
		auto var label:gtTextNode;
		public var mainButton:Button;
		public var settings:SettingsWidget;
		public var settingsButton:Button;
		
		public function onCreate():void
		{
			transform.attach("mid");
			
			log("Main Screen");
			
			
			
			background = create(gtShapeNode);
			
			background.drawRect(scene.width, scene.height, 0xDDDDDD);
			background.attach();
			
			label.setup("nGET");
			label.size = 50;
			label.color = 0xffffff;
			label.x = scene.width / 2 - label.width / 2 + 30;
			label.y = scene.height / 2;

			label.attach();
			
			
			
		 	mainButton = create(Button);
			mainButton.setup(150, 75, 0xF9A651, 0x000000, "Play", [UserScripts, "goToLivesScreen"]);
			mainButton.transform.x = scene.width / 2 - 50;
			mainButton.transform.y = scene.height * 2/3;
			
			settingsButton = create(Button);
			settingsButton.setup(50, 50, 0x333333, 0xDDDDDD, "S", [UserScripts, "toggleSettings"]);
			settingsButton.transform.x = scene.width - 10 - settingsButton.transform.width;
			settingsButton.transform.y = 10;
			settingsButton.transform.attach();
			
			settings = create(SettingsWidget);			
			settings.transform.attach();
			settings.transform.visible = false;

				
		}
		
		public function onRefreshLayout():void
		{
			
		}
		
		listener function toggleSettings():void
		{
			settings.transform.visible = !settings.transform.visible;
		}
		
		
	}
}