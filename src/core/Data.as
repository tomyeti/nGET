package core
{
	import gametheater.ISingleton;
	import gametheater.gtObject;
	import gametheater.plugins.console.gtCommandManager;
	
	public class Data extends gtObject implements ISingleton
	{
		protected var _mapXMLs:Object = null;
		protected var _keys:Array = null;
		
		public function onCreate():void
		{
			makeGlobal("data", this);
			
			_mapXMLs = new Object();
			_keys = [];
			
			//gtCommandManager.add("refresh", refreshMaps).addMan("Refreshes the level XMLs.");
			
		}
		
		//--------------XML loading logic--------------
		
		
		/*public function refreshMaps(o:Object):String
		{
			
			loadMapsData();
			
			return "Refreshing Maps";
		}
		
		public function loadMapsData():void
		{
			start("loading");
		}
		
		state function loading_onStart():void
		{
			for (var key:String in _mapXMLs)
			{
				delete(_mapXMLs[key]);
			}
			while(_keys.length > 0)
			{
				_keys.pop();
			}
			
			for(var i:int = 0; i < globals.mapHeadersXML.map.length(); i++)
			{
				loadMapData(globals.mapHeadersXML.map[i].@id);
			}
			load.reportOnComplete("mapsLoaded");
			
		}
		state function loading_xmlLoaded(id:String, xml:XML):void
		{
			log("Map loaded:", id, xml.version);
			_mapXMLs[id] = xml;
			_keys.push(id);
			
			_keys.sort();
		}
		
		state function loading_onStop():void
		{
			shout("mapDataLoaded");
		}
		
		listener function mapsLoaded():void
		{
			if(!(globals.blob.currentMap in _mapXMLs))
			{
				globals.blob.currentMap = "1"
			}
			
			delayF(1, "stop", "loading");
		}
		
		private function loadMapData(mapID:String):void
		{
			load.xml(globals.levelDataPath + "maps/map" + mapID + ".xml", mapID);			
		}
		
		listener function xmlLoaded(id:String,xml:XML):void
		{
			relay("xmlLoaded", [id, xml]);
		}
		
		public function map(id:String):XML 
		{
			return _mapXMLs[id];
		}
		
		public function get mapIDs():Array
		{
			return _keys;
		}
		
		public function get numMaps():int
		{
			return globals.mapHeadersXML..map.length();
		}
		
		public function mapHeaderXML(id:String):XML
		{
			return globals.mapHeadersXML.map.(@id == i)[0]
		}
		
		public function get currentMapHeaderXML():XML
		{
			return mapHeaderXML(globals.blob.currentMap);
		}
		
		public function getObjectiveType(id:String):XML
		{
			return globals.objectivesXML.objective.(@id == id)[0];
		}*/
	}
}