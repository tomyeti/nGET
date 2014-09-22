package gui.lives
{
	import gametheater.gtWidget;
	import gametheater.plugins.starling.nodes.gtStarlingQuadNode;
	import gametheater.render.nodes.gtShapeNode;
	import gametheater.render.nodes.gtTextNode;
	
	public class LivesCounterWidget extends gtWidget
	{
		
		use namespace auto;
		auto var backing:gtShapeNode;
		auto var mainText:gtTextNode;
		auto var heart:gtShapeNode;
		auto var nextLife:gtTextNode;
		auto var notification:gtTextNode;
		auto var livesFull:gtTextNode;
		
		
		public function onCreate():void
		{
			backing.drawRect(scene.width,scene.height - scene.height / PHI,0x888888).attach();
			heart.drawRect(50,50,0xdddddd).attach();
			heart.x = 50;
			heart.y = backing.height - backing.height / PHI;
			heart.center();
			
			mainText.setup("Get More Lives").attach();
			mainText.size = 32;
			mainText.x = scene.width / 2 - mainText.width / 2;
			mainText.y = 10;
			
			nextLife.setup("Next Life in: 00:00:00").attach();
			nextLife.size = 20;
			nextLife.x = 100 + (scene.width - 100) / 2 - nextLife.width / 2;
			nextLife.y = heart.y - heart.height / 2;
			
			livesFull.setup("(Lives Full)").attach();
			livesFull.size = 20;
			livesFull.y = nextLife.y + nextLife.height;
			livesFull.x = 100 + (scene.width - 100) / 2 - livesFull.width / 2;
			
			notification.setup("Notifications [ON/OFF]").attach();
			notification.size = 20;
			notification.x = scene.width / 2 - notification.width / 2;
			notification.y = backing.height / PHI;
		}
	}
}