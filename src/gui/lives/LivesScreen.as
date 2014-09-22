package gui.lives
{
	import gametheater.gtScreen;
	
	import gui.Button;
	import gui.UserScripts;
	
	public class LivesScreen extends gtScreen
	{
		
		use namespace auto;
		auto var exit:Button;
		auto var ask:Button;
		auto var buy:Button;
		
		public var livesCounter:LivesCounterWidget;
		
		public function onCreate():void
		{
			transform.attach("background");
		}
		
		public function onChangeTo():void
		{
			exit.setup(50,50,0x333333,0xffffff,"X", [UserScripts, "goToActionList"]).transform.attach();
			exit.label.size = 32;
			exit.centerLabel();
			exit.transform.y = 10;
			exit.transform.x = scene.width - exit.transform.width - 10;
			
			ask.setup(scene.width / PHI,100,0x444444,0xffffff,"Ask Friend").transform.attach();
			ask.label.size = 20;
			ask.centerLabel();
			ask.transform.y = scene.height - ask.transform.height - 50;
			ask.transform.x = (scene.width - ask.transform.width) / 2;
			
			buy.setup(scene.width / PHI,100,0x444444,0xffffff,"Buy: 10,000").transform.attach();
			buy.label.size = 20;
			buy.centerLabel();
			buy.transform.y = ask.transform.y - buy.transform.height - 50;
			buy.transform.x = (scene.width - buy.transform.width) / 2;
			
			link("livesCounter", create(LivesCounterWidget));
			livesCounter.transform.y = 100;
			livesCounter.transform.attach();
		}
		
		public function onChangeFrom():void
		{
			release();
		}
		
		public function onRefreshLayout():void
		{
			
		}
	}
}