package
{
	import gametheater.gtUser;
	
	public class User extends gtUser
	{
		
		public var selectedAction:String = "";
		public var actionObj:Object;
		
		
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