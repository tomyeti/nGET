package gui
{
	import gametheater.IListener;
	import gametheater.gtWidget;
	import gametheater.render.nodes.gtShapeNode;
	
	public class SettingsWidget extends gtWidget implements IListener
	{
		use namespace auto;
		auto var backing:gtShapeNode;
		public function onCreate():void
		{
			backing.drawRoundedRect(scene.width - 100, scene.height - 100, 2, 0xFFFFFF);
			backing.attach();
			backing.x = 50;
			backing.y = 50;
			
			
		}
		public function onRefreshLayout():void
		{
			
		}
	}
}