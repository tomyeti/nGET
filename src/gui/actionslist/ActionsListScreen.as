package gui.actionslist
{
	import gametheater.IListener;
	import gametheater.gtScreen;
	import gametheater.render.nodes.gtShapeNode;
	import gametheater.render.nodes.gtTransformNode;
	import gametheater.utils.gtScroller;
	
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
		
		public var lives:Button;
		public var coins:Button;
		public var level:Button;
		
		
		public var scrollTransform:gtTransformNode;
		public var scroller:gtScroller;
		
		auto var sneakyBack:gtShapeNode;

		
		public function onCreate():void
		{
			transform.attach("background");
			starlingTransform.attach("background");

		}
		
		public function onChangeTo():void
		{
			background.drawRect(scene.width,scene.height,0xeeeeee).attach();
			
			
			
			link("scroller", create(gtScroller));
			link("scrollTransform", create(gtTransformNode));
			scrollTransform.attach();
			
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
				action.transform.attach(scrollTransform);
			}
		
			
			link("settings", create(SettingsWidget));
			settings.transform.visible = false;
			
			settingsButton.setup(50, 50, 0x333333, 0xDDDDDD, "S", [UserScripts, "toggleSettings"]);
			settingsButton.transform.x = scene.width - 10 - settingsButton.transform.width;
			settingsButton.transform.y = 10;
			settingsButton.transform.attach();
			
			settings.transform.attach();

			
			scroller.setup("scrollY", scrollTransform, 50);
			scroller.useBackground(background);
			
			
			sneakyBack.drawRect(background.width, 200, 0xEEEEEE).attach();
			
			lives = create(Button);
			lives.setup(scene.width / 3 - 13  , 100, 0xDDDDDD, 0x000000, "Lives", [UserScripts, "goToLivesScreen"]);
			lives.transform.attach();
			
			coins = create(Button);
			coins.setup(scene.width / 3 - 13 , 100, 0xDDDDDD, 0x000000, "Coins");
			coins.transform.attach();
			
			level = create(Button);
			level.setup(scene.width / 3 - 13, 100, 0xDDDDDD, 0x000000, "Level 1", [UserScripts, "goToUserProfile"]);
			level.transform.attach();
			
			
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
				//action.transform.attach();
			}
			
			level.transform.x = 10;
			level.transform.y = 10;
			
			coins.transform.x = level.transform.x + level.transform.width + 10;
			coins.transform.y = 10;
			
			lives.transform.x = coins.transform.x + coins.transform.width + 10;
			lives.transform.y = 10;
			
		}
		
		public var _scrollY:Number = 0;
		public function get scrollY():Number { return _scrollY; }
		public function set scrollY(v:Number):void
		{

			var usableHeight:Number = actionsList.length * actionsList[0].transform.height;
			
			if (scrollTransform.y < 200 - usableHeight)
			{
				scrollTransform.y = _scrollY = 200 - usableHeight;
			}
			else
			{
				scrollTransform.y = _scrollY = v;

			}

			
			
			
		}
		public function onScrollerEnd():void
		{
			//called by gtScroller
		}
		
		
		listener function toggleSettings():void
		{
			settings.transform.visible = !settings.transform.visible;
		}
	}
}