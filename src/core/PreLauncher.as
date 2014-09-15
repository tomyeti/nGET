package core
{
	import flash.display.Bitmap;
	
	import gametheater.IListener;
	import gametheater.gtObject;
	import gametheater.render.nodes.gtShapeNode;
	import gametheater.render.nodes.gtTextNode;
	
	public final class PreLauncher extends gtObject implements IListener
	{
		use namespace auto;
		
		
		
		[Embed(source="/Default-Portrait.png")]
		public static const SplashTexture:Class;
		public var bmp:Bitmap = null;
		public function onCreate():void
		{
			
			scene.addLayer("PRELAUNCH_LAYER",90000);
			
			bmp = scene.getLayer("PRELAUNCH_LAYER").content.addChild(new SplashTexture()) as Bitmap;
			bmp.width = stage.stageWidth;
			bmp.height = stage.stageHeight;
			
			
		}
		
	
		
		
		
		listener function removePreLauncher():void
		{
			delayF(2,"onRelease");
		}
		
		public function onRelease():void
		{
			if (bmp)
			{	
				bmp.parent.removeChild(bmp);
				bmp.bitmapData.dispose();
			}
			bmp = null;
		}
	}
}