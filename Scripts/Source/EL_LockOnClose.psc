Scriptname EL_LockOnClose extends ObjectReference  

Event OnClose(ObjectReference akActionRef)
	Lock(true, true)
endEvent