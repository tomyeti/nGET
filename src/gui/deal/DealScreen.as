package gui.deal
{
	import gametheater.gtScreen;
	import gametheater.render.nodes.gtShapeNode;
	import gametheater.render.nodes.gtTextNode;
	
	import gui.Button;
	import gui.UserScripts;
	
	public class DealScreen extends gtScreen
	{
		
		use namespace auto;
		
		auto var upperBacking:gtShapeNode;
		
		auto var xpText:gtTextNode;
		auto var dealExpires:gtTextNode;
		auto var dealTime:gtTextNode;
		auto var actionText:gtTextNode;
		
		public var doStuff:Button;
		public var buy:Button;
		public var exit:Button;
		
		auto var heart:gtShapeNode;
		auto var heartValue:gtTextNode;
		
		auto var coin:gtShapeNode;
		
		
		
		public function onCreate():void
		{
			transform.attach("background");
			starlingTransform.attach("background");

			
			
			
		}
		
		public function onChangeTo():void
		{
			upperBacking.drawRect(scene.width, scene.height / 5, 0xCCCCCC).attach();
			
			xpText.setup(user.actionObj.xp).attach();
			xpText.size = 30;
			
			dealExpires.setup("Deal Expires").attach();
			dealExpires.size = 30;
			dealExpires.color = 0xEEEEEE;
			
			dealTime.setup("4 days, 12 hours").attach();
			dealTime.size = 25;
			
			actionText.setup(user.actionObj.action).attach();
			actionText.size = 40;
			
			heart.drawCircle(30, 0xAAAAAA);
			heart.attach();
			
			heartValue.setup("1").attach();
			heartValue.size = 40;
			
			doStuff = create(Button);
			doStuff.setup(scene.width / 2, 100, 0x666666, 0xFFFFFF, "Do Stuff", [UserScripts, "goToTakeAction"]);
			doStuff.transform.attach();
			
			buy = create(Button);
			buy.setup(scene.width / 2, 100, 0x999999, 0xFFFFFF, "10,000");
			buy.transform.attach();
			
			exit = create(Button);
			exit.setup(50, 50, 0x222222, 0xFFFFFF, "X", [UserScripts, "goToActionList"]);
			exit.transform.attach();
			
			coin.drawCircle(25, 0xFFFFFF).attach();
		}
		
		public function onChangeFrom():void
		{
			release();
		}
		
		public function onRefreshLayout():void
		{
			upperBacking.x = 0;
			upperBacking.y = scene.height / 6;
			
			xpText.x = upperBacking.width / 2 - xpText.width / 2;
			xpText.y = upperBacking.y + xpText.height;
			
			dealExpires.x = upperBacking.width / 2 - dealExpires.width / 2;
			dealExpires.y = xpText.y + dealExpires.height;
			
			dealTime.x = upperBacking.width / 2 - dealTime.width / 2;
			dealTime.y = dealExpires.y + dealTime.height;
			
			actionText.x = scene.width / 2 - actionText.width / 2;
			actionText.y = scene.height / 2;
			
			heart.x = scene.width / 2 - heart.width / 2;
			heart.y = upperBacking.y + upperBacking.height + 10;
			
			heartValue.x = heart.x + heart.width / 2 - heartValue.width / 2;
			heartValue.y = heart.y + heart.height / 2 - heartValue.height / 2;
			
			doStuff.transform.x = scene.width / 2 - doStuff.transform.width / 2;
			
			buy.transform.x = doStuff.transform.x;
			buy.transform.y = scene.height - doStuff.transform.height - 10
			doStuff.transform.y = buy.transform.y - doStuff.transform.height - 10;
			
			exit.transform.x = scene.width - exit.transform.width - 10;
			exit.transform.y = 10;
			
			coin.x = buy.transform.x + 20;
			coin.y = buy.transform.y + buy.transform.height / 2 - coin.height / 2;
			
			
			
		}
	}
}