class canhao extends MovieClip{
	function canhao(){
		
	}
	public function moverDireita(){
		this._x+=10;
	}
	private function moverEsquerda(){
		this._x-=10;
	}
	private function mirarCima(){
		this._rotation--;
	}
	private function mirarBaixo(){
		this._rotation++;
	}
	private function atirar(){
		new bola(30,30,this._x,this._y);
		//this._parent.attachMovie("lblBola","b"+(++_root.nBola)+"_mc",this._parent.getNextHighestDepth());
		//b_mc._y=this._y;
	}
	public function morrer(){
		this.removeMovieClip();
	}
}