package core
{
	import gametheater.ISingleton;
	import gametheater.gtObject;
	
	public final class Vocab extends gtObject implements ISingleton
	{
		public function onCreate():void
		{
			makeGlobal("vocab", this);
		}
		//TODO
		//Add vocab XML as per copy function
		public static function copy(id:String):String
		{
			if (globals.vocabXML)
				return globals.vocabXML.copy.(@id == id).toString();
			else
				return "";
		}
	}
}