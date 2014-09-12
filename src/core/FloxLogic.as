package core
{
	import flox.FloxPlayerUtils;
	
	import gametheater.ISingleton;
	import gametheater.gtObject;
	
	public final class FloxLogic extends gtObject implements ISingleton
	{
		listener function floxLogout():void
		{
			log("clearing local blob because flox player logged out");
			if (globals.blob)
				globals.blob.clear();
			else
				log("could not clear blob as it happened at app launch");
		}
		
		listener function floxPlayerStash():void
		{
			FloxPlayerUtils.stash(globals.floxSession.player);
		}
		
		listener function floxPlayerResolveConflicts():void
		{
			FloxPlayerUtils.merge(globals.floxSession.player);
		}
	}
}