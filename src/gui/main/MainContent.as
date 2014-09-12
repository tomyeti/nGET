package gui.main
{
	import gametheater.IListener;
	import gametheater.gtWidget;
	import gametheater.render.nodes.gtShapeNode;
	import gametheater.render.nodes.gtTextNode;
	
	import gui.Button;
	
	public final dynamic class MainContent extends gtWidget implements IListener
	{
		use namespace auto;
		auto var background:gtShapeNode;
		auto var label:gtTextNode;
		public var mainButton:Button;
		
		public function onCreate():void
		{
			transform.attach("mid");
			
			log("main screen");
			
			background = create(gtShapeNode);
			
			background.drawRect(scene.width, scene.height, 0xDDDDDD);
			background.attach();
			
			label.setup("nGET");
			label.size = 50;
			label.color = 0xffffff;
			label.x = scene.width / 2 - label.width / 2 + 30;
			label.y = scene.height / 2;

			label.attach();
			
			
		 	mainButton = create(Button);
			mainButton.setup(150, 75, 0xF9A651, 0x000000, "Play");
			mainButton.transform.x = scene.width / 2 - 50;
			mainButton.transform.y = scene.height * 2/3
		}
		
		public function onRefreshLayout():void
		{
			
		}
		
		
	}
}