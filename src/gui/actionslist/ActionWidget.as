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
		
		public var actionName:String = "do this";
		
		public var clickAction:gtClickAction;
		
		public function onCreate():void
		{
			
			backing.drawRect(scene.width,100,0xaaaaaa).attach();
			actionText.setup("do this").attach();
			difficultyText.setup("easy").attach();
			
			actionText.color = 0xffffff;
			
			actionText.y = 10;
			actionText.x = backing.width - actionText.width - 10;
			
			difficultyText.y = actionText.y + 10;
			difficultyText.x = backing.width - difficultyText.width - 10;
			
			link("clickAction", create(gtClickAction));
			clickAction.setup(backing).pushScript([UserScripts, "goToDeal"]);
			
			mouse(backing).raw();
		}
		
		public function onMouseDown(o:Object, e:MouseEvent):void
		{
			user.selectedAction = actionName;
		}
		
		public function setup(action:String, difficulty:String):void
		{
			actionText.text = action;
			difficultyText.text = difficulty;
			
			actionText.y = 10;
			actionText.x = backing.width - actionText.width - 10;
			
			difficultyText.y = actionText.y + 10;
			difficultyText.x = backing.width - difficultyText.width - 10;
		}
	}
}