package gui.userprofile
{
	import gametheater.gtScreen;
	import gametheater.render.nodes.gtShapeNode;
	import gametheater.render.nodes.gtTextNode;
	
	import gui.Button;
	import gui.UserScripts;
	
	public class UserProfileScreen extends gtScreen
	{
		use namespace auto;
		
		auto var backing:gtShapeNode;
		auto var level:gtTextNode;
		auto var title:gtTextNode;
		
		auto var xpBacking:gtShapeNode;
		auto var xp:gtShapeNode;
		
		auto var smiley:gtShapeNode;
		
		public var exit:Button;
		

		
		public function onCreate():void
		{
			transform.attach("background");
			backing.drawRoundedRect(scene.width - 20, scene.height / 5, 25, 0xBBBBBB).attach();
			
			
			
			xpBacking.drawRect(backing.width - 50, 50, 0xEEEEEE).attach();
			xp.drawRect(xpBacking.width * .65, 50, 0x777777).attach();
			
			level.setup("Level: 3").attach();
			level.size = 30;
			level.color = 0xEEEEEE;
			title.setup("Smart Person").attach();
			title.size = 30;
			title.color = 0xEEEEEE;
			
			smiley.drawCircle(30, 0xEEEEEE).attach();
			
			exit = create(Button);
			exit.setup(50, 50, 0x222222, 0xFFFFFF, "X", [UserScripts, "goToActionList"]);
			exit.transform.attach();
			
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
			
			exit.transform.x = scene.width - exit.transform.width - 10;
			exit.transform.y = 10;
			
			backing.x = 10;
			backing.y = exit.transform.y + exit.transform.height + 10;
			
			xpBacking.x = backing.x + 25;
			xpBacking.y = backing.y + backing.height - 25 - xpBacking.height;
			
			xp.x = xpBacking.x;
			xp.y = xpBacking.y;
			
			level.x = backing.x + 25;
			
			title.x = level.x;
			title.y = backing.y + backing.height / 2 - title.height / 2 - 10;
			level.y = title.y - level.height;
			
			smiley.x = backing.x + backing.width - smiley.width - 25;
			smiley.y = backing.y + 25;
			
			
		}
	}
}