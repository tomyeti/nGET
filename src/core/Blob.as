package core
{
	import gametheater.gtBlob;
	
	public class Blob extends gtBlob
	{
		public static var VERSION:String = "0.0.1";
		
		public function onCreate():void
		{
			
			setSaveKey("com.nget.blob");
			
			if(version != VERSION)
			{
				log("clearing old blob with version:", version);
				clear();
			}
			
//			clear();
			makeGlobal("blob",this);
		}
		
		
		public function get version():String { return getValue("version", VERSION); }
		
	}
}