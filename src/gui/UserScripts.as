package gui
{
	import gametheater.IScript;
	import gametheater.gtObject;
	import gametheater.core.gtClickAction;
	
	import gui.actionslist.ActionsListScreen;
	import gui.deal.DealScreen;
	import gui.lives.LivesScreen;
	import gui.takeaction.TakeActionScreen;
	import gui.userprofile.UserProfileScreen;
	
	public class UserScripts extends gtObject implements IScript
	{
		public function goToActionList(a:gtClickAction):void
		{
			user.changeScreen(ActionsListScreen,false);
		}
		
		public function goToLivesScreen(a:gtClickAction):void
		{
			user.changeScreen(LivesScreen,false);
		}
		
		public function goToUserProfile(a:gtClickAction):void
		{
			user.changeScreen(UserProfileScreen,false);
		}
		public function goToDeal(a:gtClickAction):void
		{
			user.changeScreen(DealScreen,false);
		}
		
		public function goToTakeAction(a:gtClickAction):void
		{
			user.changeScreen(TakeActionScreen,false);
		}
		public function toggleSettings(a:gtClickAction):void
		{
			shout("toggleSettings");
		}
		
	}
}