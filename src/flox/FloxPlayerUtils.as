package flox
{
	import gametheater.gtObject;
	
	public class FloxPlayerUtils extends gtObject
	{
		public static var highScores:Array = [];
		public static var purchases:Object = {};
		public static var consumablesReceived:Object = {};
		public static var consumablesUsed:Object = {};
		public static var rating:Object = {};
		
		public static function validate(player:FloxPlayer):void
		{
			
		}
		
		public static function stash(player:FloxPlayer):void
		{
			highScores = player.highScores.concat();
			
			purchases = {};
			for (var i:* in player.purchases)
				purchases[i] = player.purchases[i];
			
			consumablesReceived = {};
			for (i in player.consumablesReceived)
				consumablesReceived[i] = player.consumablesReceived[i];
			
			consumablesUsed = {};
			for (i in player.consumablesUsed)
				consumablesUsed[i] = player.consumablesUsed[i];
			
			rating = {};
			for (i in player.rating)
				rating[i] = player.rating[i];
		}
		
		public static function merge(player:FloxPlayer):void
		{
			var save:Boolean = false;
			//gt.log("merging blob data");
			//gt.log("------------------------------");
			for (var i:* in highScores)
			{
				if (highScores[i] != undefined)
				{
					if (player.highScores[i] == undefined || player.highScores[i] < highScores[i])
					{
						//						gt.log(i,"changed from",player.highScores[i],"to",highScores[i]);
						player.highScores[i] = highScores[i];
						save = true;
					}
				}
			}
			
			for (i in purchases)
			{
				if (purchases[i] != undefined)
				{
					if (player.purchases[i] == undefined)
					{
						//						gt.log(i,"changed from",player.purchases[i],"to",purchases[i]);
						player.purchases[i] = purchases[i];
						save = true;
					}
				}
			}
			
			for (i in consumablesReceived)
			{
				if (consumablesReceived[i] != undefined)
				{
					if (player.consumablesReceived[i] == undefined || player.consumablesReceived[i] < consumablesReceived[i])
					{
						//						gt.log(i,"changed from",player.consumablesReceived[i],"to",consumablesReceived[i]);
						player.consumablesReceived[i] = consumablesReceived[i];
						save = true;
					}
				}
			}
			
			for (i in consumablesUsed)
			{
				if (consumablesUsed[i] != undefined)
				{
					if (player.consumablesUsed[i] == undefined || player.consumablesUsed[i] < consumablesUsed[i])
					{
						//						gt.log(i,"changed from",player.consumablesUsed[i],"to",consumablesUsed[i]);
						player.consumablesUsed[i] = consumablesUsed[i];
						save = true;
					}
				}
			}
			
			// ratingfor (i in consumablesUsed)
			for (i in rating)
			{
				if (rating[i] != undefined) //  does the cached copy have a value
				{
					if (player.rating[i] == undefined) // if the new blob has no value use ours
					{
						player.rating[i] = rating[i];
						save = true;
					}
					else if (player.rating[i] != rating[i])// if it has a value but there is a conflict
					{
						if (player.rating[i] == "ready")
						{
							if(rating[i] == "declined" || rating[i] == "offered")
							{
								player.rating[i] = rating[i];
								save = true;
							}
						}
						else if (player.rating[i] == "offered")
						{
							if(rating[i] == "declined")
							{
								player.rating[i] = rating[i];
								save = true;
							}
						}
					}
				}
			}
			
			
			
			//			gt.log("------------------------------");
			
			if (save)
				player.saveQueued();
		}
	}
}