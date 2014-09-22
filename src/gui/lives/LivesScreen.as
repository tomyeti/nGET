package gui.lives
{
	import gametheater.gtScreen;
	
	import gui.Button;
	
	public class LivesScreen extends gtScreen
	{
		
		use namespace auto;
		
		public var mainHeader:Button;
		
		public function onCreate():void
		{
			transform.attach("background");
		}
		
		public function onChangeTo():void
		{
			
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