class cannon extends MovieClip{
	var spaceTime;
	var intervalID=0;
	var body:MovieClip;
	var wheel:MovieClip;
	
	
	function cannon(){
		//body._xscale*=-1;
		//body._yscale*=-1;
	}
	private function position(pos){
		this.wheel._rotation=pos>this._x?this.wheel._rotation+15:this.wheel._rotation-15;
		this._x=Math.max(Math.min(pos,390),20);
		//if(this._x>0 or this._x<400)
		
	}
	private function rotate (degree, scale) {
		if(scale==1)
		this.body._rotation=Math.max(degree,-75)
		else
		this.body._rotation=(degree*-1)+180;//Math.min((degree*-1)+180, -25);//Math.min(-125,Math.max(degree,145));
	}
	public function startTimer(){
		if(this.intervalID!=0)return;
		clearInterval(this.intervalID);
		this.spaceTime=0;
		this.intervalID=setInterval(measureTime,100,this);
	}
	private function measureTime(movie){
		trace(movie.spaceTime);
		movie.spaceTime++;
	}
	private function atirar(){
		clearInterval(this.intervalID);
		this.intervalID=0;
		var velTotal=this.spaceTime;
		var velx=velTotal*Math.sin((this._rotation/180)*Math.PI);
		var vely=velTotal*Math.cos((this._rotation/180)*Math.PI);
		trace('velx:'+velx+' vely:'+vely);
		this._parent.attachMovie("lblBola","b"+(_root.nBola),this._parent.getNextHighestDepth());
		set("_root.b"+(_root.nBola)+"._x",this._x);
		set("_root.b"+(_root.nBola)+"._y",this._y);
		set("_root.b"+(_root.nBola)+".velx",velx);
		set("_root.b"+(_root.nBola)+".vely",vely);
		_root.nBola++;
	}
	public function morrer(){
		this.removeMovieClip();
	}
}