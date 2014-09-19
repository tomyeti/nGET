package gui.actionslist
{
	import flash.events.MouseEvent;
	
	import gametheater.IListener;
	import gametheater.gtWidget;
	import gametheater.core.gtClickAction;
	import gametheater.render.nodes.gtShapeNode;
	import gametheater.render.nodes.gtTextNode;
	
	import gui.UserScripts;
	
	public class ActionWidget extends gtWidget implements IListener
	{
		
		use namespace auto;
		auto var backing:gtShapeNode;
		auto var actionText:gtTextNode;
		auto var difficultyText:gtTextNode;
		auto var xpText:gtTextNode
		public var actionName:String = "do this";
		
		public var clickAction:gtClickAction;
		
		public function onCreate():void
		{
			
			backing.drawRect(scene.width,150,0xaaaaaa).attach();
			actionText.setup("do this").attach();
			difficultyText.setup("easy").attach();
			xpText.setup("100 XP").attach();
			
			actionText.color = xpText.color = 0xffffff;
			
			actionText.y = 10;
			actionText.x = backing.width - actionText.width - 10;
			actionText.size = 40;
			
			
			difficultyText.y = actionText.y + 10;
			difficultyText.x = backing.width - difficultyText.width - 10;
			difficultyText.size = 30;
			
			xpText.size = 40;
			
			
			
			link("clickAction", create(gtClickAction));
			clickAction.setup(backing).pushScript([UserScripts, "goToDeal"]);
			
			mouse(backing).raw();
		}
		
		public function onMouseDown(o:Object, e:MouseEvent):void
		{
			user.selectedAction = actionName;
			
			var obj:Object = {};
			obj.action = actionName;
			obj.xp = xpText.text;
			user.actionObj = obj;
		}
		
		public function setup(action:String, difficulty:String, xp:String):void
		{
			actionText.text = actionName = action;
			difficultyText.text = difficulty;
			xpText.text = xp;
			
			actionText.y = 10;
			actionText.x = backing.width - actionText.width - 10;
			
			difficultyText.y = actionText.y + actionText.height;
			difficultyText.x = backing.width - difficultyText.width - 10;
			
			xpText.x = backing.x + 10;
			xpText.y = backing.y + backing.height / 2 - xpText.height / 2;
		}
	}
}