package com.ting3.player.view
{
    import org.puremvc.as3.multicore.patterns.mediator.Mediator;
    import com.ting3.player.model.ConfigProxy;
    import com.ting3.player.model.TracklistProxy;
    import com.ting3.player.model.SkinProxy;
    import com.ting3.player.model.MP3PlayCoreProxy;
    import com.ting3.player.model.ComponentsModelProxy;

    public class BasicMediator extends Mediator
    {
	public function BasicMediator(mediatorName:String=null, viewComponent:Object=null)
	{
	    super(mediatorName, viewComponent);
	}

	protected function getConfigProxy():ConfigProxy {
	    return facade.retrieveProxy(ConfigProxy.NAME) as ConfigProxy;
	}

	protected function getTracklistProxy():TracklistProxy {
	    return facade.retrieveProxy(TracklistProxy.NAME) as TracklistProxy;
	}

	protected function getSkinProxy():SkinProxy {
	    return facade.retrieveProxy(SkinProxy.NAME) as SkinProxy;
	}

	protected function getPlayCoreProxy():MP3PlayCoreProxy{
	    return facade.retrieveProxy(MP3PlayCoreProxy.NAME) as MP3PlayCoreProxy;
	}

	protected function getModelProxy():ComponentsModelProxy{
	    return facade.retrieveProxy(ComponentsModelProxy.NAME) as ComponentsModelProxy;
	}
    }
}
