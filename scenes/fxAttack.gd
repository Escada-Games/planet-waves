extends Node2D

var fRadius := 0.0

func _ready() -> void:
	$tween.interpolate_property(self,'fRadius',0,64,0.66,Tween.TRANS_BACK,Tween.EASE_OUT)
	$tween.start()
#	$tween.connect("tween_all_completed",self,'goAway')
	set_process(true)

func _process(_delta:float) -> void:
	update()

func _draw() -> void:
	draw_arc(Vector2(),self.fRadius,0,2*PI,360,global.colors['red'],8)

func goAway() -> void:
	var _v = $tween.interpolate_property(self,'modulate:a',self.modulate.a,0,0.4,Tween.TRANS_QUINT,Tween.EASE_IN)
	_v = $tween.start()
	
	yield($tween,"tween_all_completed")
	
	self.queue_free()
