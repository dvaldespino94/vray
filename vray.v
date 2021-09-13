module main

import raylib as r
import net.unix

enum TransportStatus {
	playing = 1
	stopped
	paused
}

fn get_status(mut conn unix.StreamConn) ?TransportStatus {
	mut buff := []byte{len: 4}

	conn.write([byte(0x13), 0, 0, 0]) ?

	for {
		conn.read(mut buff) ?
		if buff[0] == 0x6 {
			conn.read(mut buff) ?
			break
		}
		println('Skipping data: $buff')
	}

	println('Received $buff')
	return TransportStatus(buff[4])
}

fn main() {
	r.init_window(200, 200, 'V Ray Bindings')
	r.set_target_fps(20)

	mut conn := unix.connect_stream('/home/ddt/.moc/socket2') ?

	for !r.window_should_close() {
		r.begin_drawing()
		r.draw_background()
		button_rect := C.Rectangle{10, 10, r.get_screen_width() - 20, 20}
		if r.gui_button(button_rect, 'Play/Pause') {
			println('Play/Pause')
			status:=get_status(mut conn) ?
			println("Status is $status")
			match status {
				.playing { conn.write([byte(0x5), 0, 0, 0]) ? }
				else { conn.write([byte(0x6), 0, 0, 0]) ? }
			}
		}
		r.end_drawing()
	}

	return
}
