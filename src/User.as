package
{
	import gametheater.gtUser;
	
	public class User extends gtUser
	{
		public function onCreate():void
		{
			makeGlobal("user", this);
		}
		
		public function changeScreen(scr:*,force:Boolean = false):void
		{
			flow.changeScreen(scr,force);
			
			shout("changing Screen");
		}
	}
}