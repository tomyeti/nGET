package gui.main
{
	import gametheater.gtScreen;
	
	
	public class MainScreen extends gtScreen
	{
		public function onCreate():void
		{
			transform.attach("background");
			starlingTransform.attach("background");

		}
		
		public function onChangeTo():void
		{
			create(MainContent);
		}
		
		public function onChangeFrom():void
		{
			release();
		}
	}
}