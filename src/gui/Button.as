package gui
{
	import gametheater.gtObject;
	import gametheater.gtWidget;
	import gametheater.core.gtClickAction;
	import gametheater.render.nodes.gtShapeNode;
	import gametheater.render.nodes.gtTextNode;
	
	public class Button extends gtWidget
	{
		
		// Auto Create Logic
		//-----------------------------------------------------
		registerAuto();
		public static function registerAuto():void {_autoEnabled["gui::Button"] = Button;}
		public static function autoSetup(o:gtObject,variable:String):void
		{
			o.link(variable,o.create(Button));
		}
		
		
		use namespace auto;
		auto var back:gtShapeNode;
		auto var buttonClick:gtClickAction;
		auto var label:gtTextNode;
		
		public function onCreate():void
		{
			back.drawRect(100,100,0xffffff);
			label.setup("BUTTON");
			
			
		}
		public function setup(w:Number, h:Number, color:uint, labelColor:uint, text:String, s:* = null):void
		{
			back.clear().drawRect(w,h,color);
			label.setup(text);
			label.color = labelColor;
			
			buttonClick.setup(back).pushScript(s);
			
			back.attach();
			label.attach();
			
			if(back.height > back.width)label.size = (back.height/2 - back.width/2);
			if(back.width > back.height)label.size = (back.width/2 - back.height/2)/3;
			if(back.width == back.height)label.size = back.width/4;
			label.x = back.width / 2 - label.width / 2;
			label.y = back.height / 2 - label.height / 2;
			
			
		}
		
		public function centerLabel():void
		{
			if(back.height > back.width)label.size = (back.height/2 - back.width/2);
			if(back.width > back.height)label.size = (back.width/2 - back.height/2)/3;
			if(back.width == back.height)label.size = back.width/4;
			label.x = back.width / 2 - label.width / 2;
			label.y = back.height / 2 - label.height / 2;
		}
		
	}
}