package gui.userprofile
{
	import gametheater.gtScreen;
	
	public class UserProfileScreen extends gtScreen
	{
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