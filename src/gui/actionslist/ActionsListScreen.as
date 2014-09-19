package gui.actionslist
{
	import gametheater.IListener;
	import gametheater.gtScreen;
	import gametheater.render.nodes.gtShapeNode;
	
	import gui.Button;
	import gui.SettingsWidget;
	import gui.UserScripts;
	
	public class ActionsListScreen extends gtScreen implements IListener
	{
		use namespace auto;
		auto var background:gtShapeNode;
		auto var settingsButton:Button;
		public var settings:SettingsWidget;
		
		public var actionsList:Array = [];
		
		public function onCreate():void
		{
			transform.attach("background");
		}
		
		public function onChangeTo():void
		{
			background.drawRect(scene.width,scene.height,0xeeeeee).attach();
			link("settings", create(SettingsWidget));
			settings.transform.attach();
			settings.transform.visible = false;
			
			settingsButton.setup(50, 50, 0x333333, 0xDDDDDD, "S", [UserScripts, "toggleSettings"]);
			settingsButton.transform.x = scene.width - 10 - settingsButton.transform.width;
			settingsButton.transform.y = 10;
			settingsButton.transform.attach();
			
			
			var action1:ActionWidget = create(ActionWidget);
			var action2:ActionWidget = create(ActionWidget);
			var action3:ActionWidget = create(ActionWidget);
			var action4:ActionWidget = create(ActionWidget);
			
			actionsList.push(action1);
			actionsList.push(action2);
			actionsList.push(action3);
			actionsList.push(action4);
			
			action1.setup("puzzle of the day", "easy", "200 xp");
			action2.setup("puzzle of the day", "medium", "500 xp" );
			action3.setup("puzzle of the day", "hard", "800 xp");
			action4.setup("gift", "easy", "15 xp");
			for(var i:int = 0; i < actionsList.length; i++)
			{
				var action:ActionWidget = actionsList[i];
				action.transform.y = 100 + action.transform.height * i;
				action.transform.attach();
			}
			
		}
		
		public function onChangeFrom():void
		{
			release();
		}
		
		public function onRefreshLayout():void
		{
			for(var i:int = 0; i < actionsList.length; i++)
			{
				var action:ActionWidget = actionsList[i];
				action.transform.y = 300 + (action.transform.height + 10 )* i;
				action.transform.attach();
			}
		}
		
		listener function toggleSettings():void
		{
			settings.transform.visible = !settings.transform.visible;
		}
	}
}