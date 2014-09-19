package gui.takeaction
{
	import gametheater.gtScreen;
	
	import gui.Button;
	import gui.UserScripts;
	
	public class TakeActionScreen extends gtScreen
	{
		use namespace auto;
		
		public var exit:Button;
		
		
		public function onCreate():void
		{
			transform.attach("background");

		}
		
		public function onChangeTo():void
		{
			exit = create(Button);
			exit.setup(50, 50, 0x000000, 0xFFFFFF, "II", [UserScripts, "goToActionList"]);
			exit.transform.attach();
		}
		
		public function onChangeFrom():void
		{
			release();
		}
		
		public function onRefreshLayout():void
		{
			exit.transform.x = 10;
			exit.transform.y = 10;
		}
	}
}