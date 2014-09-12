package core
{
	import gametheater.IListener;
	import gametheater.gtObject;
	import gametheater.render.nodes.gtShapeNode;
	import gametheater.render.nodes.gtTextNode;
	
	public final class PreLauncher extends gtObject implements IListener
	{
		use namespace auto;
		auto var background:gtShapeNode;
		auto var label:gtTextNode;
		public function onCreate():void
		{
			//scene.addLayer("PRELAUNCH_LAYER",90000);
			background = create(gtShapeNode);
			
			background.drawRect(scene.width, scene.height, 0xDDDDDD);
			background.attach();
			
			label.setup("nGET");
			label.center();
			label.size = 30;
			label.color = 0xffffff;
			label.x = scene.width / 2;
			label.y = scene.height / 2;
			label.attach();
		}
		
		listener function sceneResize():void
		{
			background.width = scene.width;
			background.height = scene.height;
			
		}
		
		listener function removePreLauncher():void
		{
			delayF(60,"release");
		}
		
		public function onRelease():void
		{
			if (background != null) background.release();
		}
	}
}