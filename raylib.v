module raylib

#flag -DRAYGUI_IMPLEMENTATION=1 -DRAYGUI_SUPPORT_RICONS=1 -DRAYGUI_TEXTBOX_EXTENDED=1 -lraylib
#include <raylib.h>
#include <raygui.h>

pub fn draw_background() {
	C.ClearBackground(C.Color{220, 220, 220, 255})

	w := C.GetScreenWidth()
	h := C.GetScreenHeight()
	c := C.Color{215, 215, 215, 255}

	mut i := 0
	for (i < h) {
		C.DrawLineEx(C.Vector2{0, i}, C.Vector2{w, i}, 2, c)
		i += 4
	}
}

// Vector2 type
struct C.Vector2 {
	x f32
	y f32
}

// Vector3 type
struct C.Vector3 {
	x f32
	y f32
	z f32
}

// Vector4 type
struct C.Vector4 {
	x f32
	y f32
	z f32
	w f32
}

// Color type, RGBA (32bit)
struct C.Color {
	r u8
	g u8
	b u8
	a u8
}

// Rectangle type
struct C.Rectangle {
	x      int
	y      int
	width  int
	height int
}

struct C.GuiTextBoxState {
	cursor  int
	start   int
	index   int
	@select int
}

struct C.Image {
	data    voidptr
	width   int
	height  int
	mipmaps int
	format  int
}

// Texture type
// NOTE: Data stored in GPU memory
struct C.Texture {
	id      u32
	width   int
	height  int
	mipmaps int
	format  int
}

struct C.Font {
	baseSize     int
	charsCount   int
	charsPadding int
	texture      C.Texture2D
	recs         &C.Rectangle
	chars        &C.CharInfo
}

struct C.Wave {
	sampleCount u32
	sampleRate  u32
	sampleSize  u32
	channels    u32
	data        voidptr
}

// Audio stream type
// NOTE: Useful to create custom audio streams not bound to a specific file
struct C.AudioStream {
	buffer voidptr

	sampleRate u32
	sampleSize u32
	channels   u32
}

// Sound source type
struct C.Sound {
	stream      C.AudioStream
	sampleCount u32
}

// Music stream type (audio file streaming from memory)
// NOTE: Anything longer than ~10 seconds should be streamed
struct C.Music {
	stream      C.AudioStream
	sampleCount u32
	looping     bool

	ctxType int
	ctxData voidptr
}

fn C.InitWindow(width int, height int, title &char)

[inline]
pub fn init_window(width int, height int, title string) {
	C.InitWindow(width, height, title.str)
}

fn C.WindowShouldClose() bool

[inline]
pub fn window_should_close() bool {
	return C.WindowShouldClose()
}

fn C.CloseWindow()

[inline]
pub fn close_window() {
	C.CloseWindow()
}

fn C.IsWindowReady() bool

[inline]
pub fn is_window_ready() bool {
	return C.IsWindowReady()
}

fn C.IsWindowFullscreen() bool

[inline]
pub fn is_window_fullscreen() bool {
	return C.IsWindowFullscreen()
}

fn C.IsWindowHidden() bool

[inline]
pub fn is_window_hidden() bool {
	return C.IsWindowHidden()
}

fn C.IsWindowMinimized() bool

[inline]
pub fn is_window_minimized() bool {
	return C.IsWindowMinimized()
}

fn C.IsWindowMaximized() bool

[inline]
pub fn is_window_maximized() bool {
	return C.IsWindowMaximized()
}

fn C.IsWindowFocused() bool

[inline]
pub fn is_window_focused() bool {
	return C.IsWindowFocused()
}

fn C.IsWindowResized() bool

[inline]
pub fn is_window_resized() bool {
	return C.IsWindowResized()
}

fn C.IsWindowState(flag u32) bool

[inline]
pub fn is_window_state(flag u32) bool {
	return C.IsWindowState(flag)
}

fn C.SetWindowState(flags u32)

[inline]
pub fn set_window_state(flags u32) {
	C.SetWindowState(flags)
}

fn C.ClearWindowState(flags u32)

[inline]
pub fn clear_window_state(flags u32) {
	C.ClearWindowState(flags)
}

fn C.ToggleFullscreen()

[inline]
pub fn toggle_fullscreen() {
	C.ToggleFullscreen()
}

fn C.MaximizeWindow()

[inline]
pub fn maximize_window() {
	C.MaximizeWindow()
}

fn C.MinimizeWindow()

[inline]
pub fn minimize_window() {
	C.MinimizeWindow()
}

fn C.RestoreWindow()

[inline]
pub fn restore_window() {
	C.RestoreWindow()
}

fn C.SetWindowIcon(image C.Image)

[inline]
pub fn set_window_icon(image C.Image) {
	C.SetWindowIcon(image)
}

fn C.SetWindowTitle(title &char)

[inline]
pub fn set_window_title(title string) {
	C.SetWindowTitle(title.str)
}

fn C.SetWindowPosition(x int, y int)

[inline]
pub fn set_window_position(x int, y int) {
	C.SetWindowPosition(x, y)
}

fn C.SetWindowMonitor(monitor int)

[inline]
pub fn set_window_monitor(monitor int) {
	C.SetWindowMonitor(monitor)
}

fn C.SetWindowMinSize(width int, height int)

[inline]
pub fn set_window_min_size(width int, height int) {
	C.SetWindowMinSize(width, height)
}

fn C.SetWindowSize(width int, height int)

[inline]
pub fn set_window_size(width int, height int) {
	C.SetWindowSize(width, height)
}

fn C.GetWindowHandle() voidptr

[inline]
pub fn get_window_handle() voidptr {
	return C.GetWindowHandle()
}

fn C.GetScreenWidth() int

[inline]
pub fn get_screen_width() int {
	return C.GetScreenWidth()
}

fn C.GetScreenHeight() int

[inline]
pub fn get_screen_height() int {
	return C.GetScreenHeight()
}

fn C.GetMonitorCount() int

[inline]
pub fn get_monitor_count() int {
	return C.GetMonitorCount()
}

fn C.GetCurrentMonitor() int

[inline]
pub fn get_current_monitor() int {
	return C.GetCurrentMonitor()
}

fn C.GetMonitorPosition(monitor int) C.Vector2

[inline]
pub fn get_monitor_position(monitor int) C.Vector2 {
	return C.GetMonitorPosition(monitor)
}

fn C.GetMonitorWidth(monitor int) int

[inline]
pub fn get_monitor_width(monitor int) int {
	return C.GetMonitorWidth(monitor)
}

fn C.GetMonitorHeight(monitor int) int

[inline]
pub fn get_monitor_height(monitor int) int {
	return C.GetMonitorHeight(monitor)
}

fn C.GetMonitorPhysicalWidth(monitor int) int

[inline]
pub fn get_monitor_physical_width(monitor int) int {
	return C.GetMonitorPhysicalWidth(monitor)
}

fn C.GetMonitorPhysicalHeight(monitor int) int

[inline]
pub fn get_monitor_physical_height(monitor int) int {
	return C.GetMonitorPhysicalHeight(monitor)
}

fn C.GetMonitorRefreshRate(monitor int) int

[inline]
pub fn get_monitor_refresh_rate(monitor int) int {
	return C.GetMonitorRefreshRate(monitor)
}

fn C.GetWindowPosition() C.Vector2

[inline]
pub fn get_window_position() C.Vector2 {
	return C.GetWindowPosition()
}

fn C.GetWindowScaleDPI() C.Vector2

[inline]
pub fn get_window_scale_dpi() C.Vector2 {
	return C.GetWindowScaleDPI()
}

fn C.GetMonitorName(monitor int) &char

[inline]
pub fn get_monitor_name(monitor int) string {
	return unsafe { C.GetMonitorName(monitor).vstring() }
}

fn C.SetClipboardText(text &char)

[inline]
pub fn set_clipboard_text(text string) {
	C.SetClipboardText(text.str)
}

fn C.GetClipboardText() &char

[inline]
pub fn get_clipboard_text() string {
	return unsafe { C.GetClipboardText().vstring() }
}

fn C.ShowCursor()

[inline]
pub fn show_cursor() {
	C.ShowCursor()
}

fn C.HideCursor()

[inline]
pub fn hide_cursor() {
	C.HideCursor()
}

fn C.IsCursorHidden() bool

[inline]
pub fn is_cursor_hidden() bool {
	return C.IsCursorHidden()
}

fn C.EnableCursor()

[inline]
pub fn enable_cursor() {
	C.EnableCursor()
}

fn C.DisableCursor()

[inline]
pub fn disable_cursor() {
	C.DisableCursor()
}

fn C.IsCursorOnScreen() bool

[inline]
pub fn is_cursor_on_screen() bool {
	return C.IsCursorOnScreen()
}

fn C.ClearBackground(color C.Color)

[inline]
pub fn clear_background(color C.Color) {
	C.ClearBackground(color)
}

fn C.BeginDrawing()

[inline]
pub fn begin_drawing() {
	C.BeginDrawing()
}

fn C.EndDrawing()

[inline]
pub fn end_drawing() {
	C.EndDrawing()
}

fn C.BeginMode2D(camera C.Camera2D)

[inline]
pub fn begin_mode2_d(camera C.Camera2D) {
	C.BeginMode2D(camera)
}

fn C.EndMode2D()

[inline]
pub fn end_mode2_d() {
	C.EndMode2D()
}

fn C.BeginMode3D(camera C.Camera3D)

[inline]
pub fn begin_mode3_d(camera C.Camera3D) {
	C.BeginMode3D(camera)
}

fn C.EndMode3D()

[inline]
pub fn end_mode3_d() {
	C.EndMode3D()
}

fn C.BeginTextureMode(target C.RenderTexture2D)

[inline]
pub fn begin_texture_mode(target C.RenderTexture2D) {
	C.BeginTextureMode(target)
}

fn C.EndTextureMode()

[inline]
pub fn end_texture_mode() {
	C.EndTextureMode()
}

fn C.BeginShaderMode(shader C.Shader)

[inline]
pub fn begin_shader_mode(shader C.Shader) {
	C.BeginShaderMode(shader)
}

fn C.EndShaderMode()

[inline]
pub fn end_shader_mode() {
	C.EndShaderMode()
}

fn C.BeginBlendMode(mode int)

[inline]
pub fn begin_blend_mode(mode int) {
	C.BeginBlendMode(mode)
}

fn C.EndBlendMode()

[inline]
pub fn end_blend_mode() {
	C.EndBlendMode()
}

fn C.BeginScissorMode(x int, y int, width int, height int)

[inline]
pub fn begin_scissor_mode(x int, y int, width int, height int) {
	C.BeginScissorMode(x, y, width, height)
}

fn C.EndScissorMode()

[inline]
pub fn end_scissor_mode() {
	C.EndScissorMode()
}

fn C.BeginVrStereoMode(config C.VrStereoConfig)

[inline]
pub fn begin_vr_stereo_mode(config C.VrStereoConfig) {
	C.BeginVrStereoMode(config)
}

fn C.EndVrStereoMode()

[inline]
pub fn end_vr_stereo_mode() {
	C.EndVrStereoMode()
}

fn C.LoadVrStereoConfig(device C.VrDeviceInfo) C.VrStereoConfig

[inline]
pub fn load_vr_stereo_config(device C.VrDeviceInfo) C.VrStereoConfig {
	return C.LoadVrStereoConfig(device)
}

fn C.UnloadVrStereoConfig(config C.VrStereoConfig)

[inline]
pub fn unload_vr_stereo_config(config C.VrStereoConfig) {
	C.UnloadVrStereoConfig(config)
}

fn C.LoadShader(vsFileName &char, fsFileName &char) C.Shader

[inline]
pub fn load_shader(vsFileName string, fsFileName string) C.Shader {
	return C.LoadShader(vsFileName.str, fsFileName.str)
}

fn C.LoadShaderFromMemory(vsCode &char, fsCode &char) C.Shader

[inline]
pub fn load_shader_from_memory(vsCode string, fsCode string) C.Shader {
	return C.LoadShaderFromMemory(vsCode.str, fsCode.str)
}

fn C.GetShaderLocation(shader C.Shader, uniformName &char) int

[inline]
pub fn get_shader_location(shader C.Shader, uniformName string) int {
	return C.GetShaderLocation(shader, uniformName.str)
}

fn C.GetShaderLocationAttrib(shader C.Shader, attribName &char) int

[inline]
pub fn get_shader_location_attrib(shader C.Shader, attribName string) int {
	return C.GetShaderLocationAttrib(shader, attribName.str)
}

fn C.SetShaderValue(shader C.Shader, locIndex int, value voidptr, uniformType int)

[inline]
pub fn set_shader_value(shader C.Shader, locIndex int, value voidptr, uniformType int) {
	C.SetShaderValue(shader, locIndex, value, uniformType)
}

fn C.SetShaderValueV(shader C.Shader, locIndex int, value voidptr, uniformType int, count int)

[inline]
pub fn set_shader_value_v(shader C.Shader, locIndex int, value voidptr, uniformType int, count int) {
	C.SetShaderValueV(shader, locIndex, value, uniformType, count)
}

fn C.SetShaderValueMatrix(shader C.Shader, locIndex int, mat C.Matrix)

[inline]
pub fn set_shader_value_matrix(shader C.Shader, locIndex int, mat C.Matrix) {
	C.SetShaderValueMatrix(shader, locIndex, mat)
}

fn C.SetShaderValueTexture(shader C.Shader, locIndex int, texture C.Texture2D)

[inline]
pub fn set_shader_value_texture(shader C.Shader, locIndex int, texture C.Texture2D) {
	C.SetShaderValueTexture(shader, locIndex, texture)
}

fn C.UnloadShader(shader C.Shader)

[inline]
pub fn unload_shader(shader C.Shader) {
	C.UnloadShader(shader)
}

fn C.GetMouseRay(mousePosition C.Vector2, camera C.Camera) C.Ray

[inline]
pub fn get_mouse_ray(mousePosition C.Vector2, camera C.Camera) C.Ray {
	return C.GetMouseRay(mousePosition, camera)
}

fn C.GetCameraMatrix(camera C.Camera) C.Matrix

[inline]
pub fn get_camera_matrix(camera C.Camera) C.Matrix {
	return C.GetCameraMatrix(camera)
}

fn C.GetCameraMatrix2D(camera C.Camera2D) C.Matrix

[inline]
pub fn get_camera_matrix2_d(camera C.Camera2D) C.Matrix {
	return C.GetCameraMatrix2D(camera)
}

fn C.GetWorldToScreen(position C.Vector3, camera C.Camera) C.Vector2

[inline]
pub fn get_world_to_screen(position C.Vector3, camera C.Camera) C.Vector2 {
	return C.GetWorldToScreen(position, camera)
}

fn C.GetWorldToScreenEx(position C.Vector3, camera C.Camera, width int, height int) C.Vector2

[inline]
pub fn get_world_to_screen_ex(position C.Vector3, camera C.Camera, width int, height int) C.Vector2 {
	return C.GetWorldToScreenEx(position, camera, width, height)
}

fn C.GetWorldToScreen2D(position C.Vector2, camera C.Camera2D) C.Vector2

[inline]
pub fn get_world_to_screen2_d(position C.Vector2, camera C.Camera2D) C.Vector2 {
	return C.GetWorldToScreen2D(position, camera)
}

fn C.GetScreenToWorld2D(position C.Vector2, camera C.Camera2D) C.Vector2

[inline]
pub fn get_screen_to_world2_d(position C.Vector2, camera C.Camera2D) C.Vector2 {
	return C.GetScreenToWorld2D(position, camera)
}

fn C.SetTargetFPS(fps int)

[inline]
pub fn set_target_fps(fps int) {
	C.SetTargetFPS(fps)
}

fn C.GetFPS() int

[inline]
pub fn get_fps() int {
	return C.GetFPS()
}

fn C.GetFrameTime() f32

[inline]
pub fn get_frame_time() f32 {
	return C.GetFrameTime()
}

fn C.GetTime() f64

[inline]
pub fn get_time() f64 {
	return C.GetTime()
}

fn C.GetRandomValue(min int, max int) int

[inline]
pub fn get_random_value(min int, max int) int {
	return C.GetRandomValue(min, max)
}

fn C.TakeScreenshot(fileName &char)

[inline]
pub fn take_screenshot(fileName string) {
	C.TakeScreenshot(fileName.str)
}

fn C.SetConfigFlags(flags u32)

[inline]
pub fn set_config_flags(flags u32) {
	C.SetConfigFlags(flags)
}

fn C.SetTraceLogLevel(logLevel int)

[inline]
pub fn set_trace_log_level(logLevel int) {
	C.SetTraceLogLevel(logLevel)
}

fn C.MemAlloc(size int) voidptr

[inline]
pub fn mem_alloc(size int) voidptr {
	return C.MemAlloc(size)
}

fn C.MemRealloc(ptr voidptr, size int) voidptr

[inline]
pub fn mem_realloc(ptr voidptr, size int) voidptr {
	return C.MemRealloc(ptr, size)
}

fn C.MemFree(ptr voidptr)

[inline]
pub fn mem_free(ptr voidptr) {
	C.MemFree(ptr)
}

fn C.SetTraceLogCallback(callback C.TraceLogCallback)

[inline]
pub fn set_trace_log_callback(callback C.TraceLogCallback) {
	C.SetTraceLogCallback(callback)
}

fn C.SetLoadFileDataCallback(callback C.LoadFileDataCallback)

[inline]
pub fn set_load_file_data_callback(callback C.LoadFileDataCallback) {
	C.SetLoadFileDataCallback(callback)
}

fn C.SetSaveFileDataCallback(callback C.SaveFileDataCallback)

[inline]
pub fn set_save_file_data_callback(callback C.SaveFileDataCallback) {
	C.SetSaveFileDataCallback(callback)
}

fn C.SetLoadFileTextCallback(callback C.LoadFileTextCallback)

[inline]
pub fn set_load_file_text_callback(callback C.LoadFileTextCallback) {
	C.SetLoadFileTextCallback(callback)
}

fn C.SetSaveFileTextCallback(callback C.SaveFileTextCallback)

[inline]
pub fn set_save_file_text_callback(callback C.SaveFileTextCallback) {
	C.SetSaveFileTextCallback(callback)
}

fn C.LoadFileData(fileName &char, bytesRead &u32) &char

[inline]
pub fn load_file_data(fileName string, bytesRead &u32) string {
	return unsafe { C.LoadFileData(fileName.str, bytesRead).vstring() }
}

fn C.UnloadFileData(data &char)

[inline]
pub fn unload_file_data(data string) {
	C.UnloadFileData(data.str)
}

fn C.SaveFileData(fileName &char, data voidptr, bytesToWrite u32) bool

[inline]
pub fn save_file_data(fileName string, data voidptr, bytesToWrite u32) bool {
	return C.SaveFileData(fileName.str, data, bytesToWrite)
}

fn C.LoadFileText(fileName &char) &char

[inline]
pub fn load_file_text(fileName string) string {
	return unsafe { C.LoadFileText(fileName.str).vstring() }
}

fn C.UnloadFileText(text &char)

[inline]
pub fn unload_file_text(text string) {
	C.UnloadFileText(text.str)
}

fn C.SaveFileText(fileName &char, text &char) bool

[inline]
pub fn save_file_text(fileName string, text string) bool {
	return C.SaveFileText(fileName.str, text.str)
}

fn C.FileExists(fileName &char) bool

[inline]
pub fn file_exists(fileName string) bool {
	return C.FileExists(fileName.str)
}

fn C.DirectoryExists(dirPath &char) bool

[inline]
pub fn directory_exists(dirPath string) bool {
	return C.DirectoryExists(dirPath.str)
}

fn C.IsFileExtension(fileName &char, ext &char) bool

[inline]
pub fn is_file_extension(fileName string, ext string) bool {
	return C.IsFileExtension(fileName.str, ext.str)
}

fn C.GetFileExtension(fileName &char) &char

[inline]
pub fn get_file_extension(fileName string) string {
	return unsafe { C.GetFileExtension(fileName.str).vstring() }
}

fn C.GetFileName(filePath &char) &char

[inline]
pub fn get_file_name(filePath string) string {
	return unsafe { C.GetFileName(filePath.str).vstring() }
}

fn C.GetFileNameWithoutExt(filePath &char) &char

[inline]
pub fn get_file_name_without_ext(filePath string) string {
	return unsafe { C.GetFileNameWithoutExt(filePath.str).vstring() }
}

fn C.GetDirectoryPath(filePath &char) &char

[inline]
pub fn get_directory_path(filePath string) string {
	return unsafe { C.GetDirectoryPath(filePath.str).vstring() }
}

fn C.GetPrevDirectoryPath(dirPath &char) &char

[inline]
pub fn get_prev_directory_path(dirPath string) string {
	return unsafe { C.GetPrevDirectoryPath(dirPath.str).vstring() }
}

fn C.GetWorkingDirectory() &char

[inline]
pub fn get_working_directory() string {
	return unsafe { C.GetWorkingDirectory().vstring() }
}

fn C.GetDirectoryFiles(dirPath &char, count &int) &&char

[inline]
pub fn get_directory_files(dirPath string, count &int) &&char {
	return C.GetDirectoryFiles(dirPath.str, count)
}

fn C.ClearDirectoryFiles()

[inline]
pub fn clear_directory_files() {
	C.ClearDirectoryFiles()
}

fn C.ChangeDirectory(dir &char) bool

[inline]
pub fn change_directory(dir string) bool {
	return C.ChangeDirectory(dir.str)
}

fn C.IsFileDropped() bool

[inline]
pub fn is_file_dropped() bool {
	return C.IsFileDropped()
}

fn C.GetDroppedFiles(count &int) &&char

[inline]
pub fn get_dropped_files(count &int) &&char {
	return C.GetDroppedFiles(count)
}

fn C.ClearDroppedFiles()

[inline]
pub fn clear_dropped_files() {
	C.ClearDroppedFiles()
}

fn C.GetFileModTime(fileName &char) i64

[inline]
pub fn get_file_mod_time(fileName string) i64 {
	return C.GetFileModTime(fileName.str)
}

fn C.CompressData(data &char, dataLength int, compDataLength &int) &char

[inline]
pub fn compress_data(data string, dataLength int, compDataLength &int) string {
	return unsafe { C.CompressData(data.str, dataLength, compDataLength).vstring() }
}

fn C.DecompressData(compData &char, compDataLength int, dataLength &int) &char

[inline]
pub fn decompress_data(compData string, compDataLength int, dataLength &int) string {
	return unsafe { C.DecompressData(compData.str, compDataLength, dataLength).vstring() }
}

fn C.SaveStorageValue(position u32, value int) bool

[inline]
pub fn save_storage_value(position u32, value int) bool {
	return C.SaveStorageValue(position, value)
}

fn C.LoadStorageValue(position u32) int

[inline]
pub fn load_storage_value(position u32) int {
	return C.LoadStorageValue(position)
}

fn C.OpenURL(url &char)

[inline]
pub fn open_url(url string) {
	C.OpenURL(url.str)
}

fn C.IsKeyPressed(key int) bool

[inline]
pub fn is_key_pressed(key int) bool {
	return C.IsKeyPressed(key)
}

fn C.IsKeyDown(key int) bool

[inline]
pub fn is_key_down(key int) bool {
	return C.IsKeyDown(key)
}

fn C.IsKeyReleased(key int) bool

[inline]
pub fn is_key_released(key int) bool {
	return C.IsKeyReleased(key)
}

fn C.IsKeyUp(key int) bool

[inline]
pub fn is_key_up(key int) bool {
	return C.IsKeyUp(key)
}

fn C.SetExitKey(key int)

[inline]
pub fn set_exit_key(key int) {
	C.SetExitKey(key)
}

fn C.GetKeyPressed() int

[inline]
pub fn get_key_pressed() int {
	return C.GetKeyPressed()
}

fn C.GetCharPressed() int

[inline]
pub fn get_char_pressed() int {
	return C.GetCharPressed()
}

fn C.IsGamepadAvailable(gamepad int) bool

[inline]
pub fn is_gamepad_available(gamepad int) bool {
	return C.IsGamepadAvailable(gamepad)
}

fn C.IsGamepadName(gamepad int, name &char) bool

[inline]
pub fn is_gamepad_name(gamepad int, name string) bool {
	return C.IsGamepadName(gamepad, name.str)
}

fn C.GetGamepadName(gamepad int) &char

[inline]
pub fn get_gamepad_name(gamepad int) string {
	return unsafe { C.GetGamepadName(gamepad).vstring() }
}

fn C.IsGamepadButtonPressed(gamepad int, button int) bool

[inline]
pub fn is_gamepad_button_pressed(gamepad int, button int) bool {
	return C.IsGamepadButtonPressed(gamepad, button)
}

fn C.IsGamepadButtonDown(gamepad int, button int) bool

[inline]
pub fn is_gamepad_button_down(gamepad int, button int) bool {
	return C.IsGamepadButtonDown(gamepad, button)
}

fn C.IsGamepadButtonReleased(gamepad int, button int) bool

[inline]
pub fn is_gamepad_button_released(gamepad int, button int) bool {
	return C.IsGamepadButtonReleased(gamepad, button)
}

fn C.IsGamepadButtonUp(gamepad int, button int) bool

[inline]
pub fn is_gamepad_button_up(gamepad int, button int) bool {
	return C.IsGamepadButtonUp(gamepad, button)
}

fn C.GetGamepadButtonPressed() int

[inline]
pub fn get_gamepad_button_pressed() int {
	return C.GetGamepadButtonPressed()
}

fn C.GetGamepadAxisCount(gamepad int) int

[inline]
pub fn get_gamepad_axis_count(gamepad int) int {
	return C.GetGamepadAxisCount(gamepad)
}

fn C.GetGamepadAxisMovement(gamepad int, axis int) f32

[inline]
pub fn get_gamepad_axis_movement(gamepad int, axis int) f32 {
	return C.GetGamepadAxisMovement(gamepad, axis)
}

fn C.SetGamepadMappings(mappings &char) int

[inline]
pub fn set_gamepad_mappings(mappings string) int {
	return C.SetGamepadMappings(mappings.str)
}

fn C.IsMouseButtonPressed(button int) bool

[inline]
pub fn is_mouse_button_pressed(button int) bool {
	return C.IsMouseButtonPressed(button)
}

fn C.IsMouseButtonDown(button int) bool

[inline]
pub fn is_mouse_button_down(button int) bool {
	return C.IsMouseButtonDown(button)
}

fn C.IsMouseButtonReleased(button int) bool

[inline]
pub fn is_mouse_button_released(button int) bool {
	return C.IsMouseButtonReleased(button)
}

fn C.IsMouseButtonUp(button int) bool

[inline]
pub fn is_mouse_button_up(button int) bool {
	return C.IsMouseButtonUp(button)
}

fn C.GetMouseX() int

[inline]
pub fn get_mouse_x() int {
	return C.GetMouseX()
}

fn C.GetMouseY() int

[inline]
pub fn get_mouse_y() int {
	return C.GetMouseY()
}

fn C.GetMousePosition() C.Vector2

[inline]
pub fn get_mouse_position() C.Vector2 {
	return C.GetMousePosition()
}

fn C.SetMousePosition(x int, y int)

[inline]
pub fn set_mouse_position(x int, y int) {
	C.SetMousePosition(x, y)
}

fn C.SetMouseOffset(offsetX int, offsetY int)

[inline]
pub fn set_mouse_offset(offsetX int, offsetY int) {
	C.SetMouseOffset(offsetX, offsetY)
}

fn C.SetMouseScale(scaleX f32, scaleY f32)

[inline]
pub fn set_mouse_scale(scaleX f32, scaleY f32) {
	C.SetMouseScale(scaleX, scaleY)
}

fn C.GetMouseWheelMove() f32

[inline]
pub fn get_mouse_wheel_move() f32 {
	return C.GetMouseWheelMove()
}

fn C.SetMouseCursor(cursor int)

[inline]
pub fn set_mouse_cursor(cursor int) {
	C.SetMouseCursor(cursor)
}

fn C.GetTouchX() int

[inline]
pub fn get_touch_x() int {
	return C.GetTouchX()
}

fn C.GetTouchY() int

[inline]
pub fn get_touch_y() int {
	return C.GetTouchY()
}

fn C.GetTouchPosition(index int) C.Vector2

[inline]
pub fn get_touch_position(index int) C.Vector2 {
	return C.GetTouchPosition(index)
}

fn C.SetGesturesEnabled(flags u32)

[inline]
pub fn set_gestures_enabled(flags u32) {
	C.SetGesturesEnabled(flags)
}

fn C.IsGestureDetected(gesture int) bool

[inline]
pub fn is_gesture_detected(gesture int) bool {
	return C.IsGestureDetected(gesture)
}

fn C.GetGestureDetected() int

[inline]
pub fn get_gesture_detected() int {
	return C.GetGestureDetected()
}

fn C.GetTouchPointsCount() int

[inline]
pub fn get_touch_points_count() int {
	return C.GetTouchPointsCount()
}

fn C.GetGestureHoldDuration() f32

[inline]
pub fn get_gesture_hold_duration() f32 {
	return C.GetGestureHoldDuration()
}

fn C.GetGestureDragVector() C.Vector2

[inline]
pub fn get_gesture_drag_vector() C.Vector2 {
	return C.GetGestureDragVector()
}

fn C.GetGestureDragAngle() f32

[inline]
pub fn get_gesture_drag_angle() f32 {
	return C.GetGestureDragAngle()
}

fn C.GetGesturePinchVector() C.Vector2

[inline]
pub fn get_gesture_pinch_vector() C.Vector2 {
	return C.GetGesturePinchVector()
}

fn C.GetGesturePinchAngle() f32

[inline]
pub fn get_gesture_pinch_angle() f32 {
	return C.GetGesturePinchAngle()
}

fn C.SetCameraMode(camera C.Camera, mode int)

[inline]
pub fn set_camera_mode(camera C.Camera, mode int) {
	C.SetCameraMode(camera, mode)
}

fn C.UpdateCamera(camera &C.Camera)

[inline]
pub fn update_camera(camera &C.Camera) {
	C.UpdateCamera(camera)
}

fn C.SetCameraPanControl(keyPan int)

[inline]
pub fn set_camera_pan_control(keyPan int) {
	C.SetCameraPanControl(keyPan)
}

fn C.SetCameraAltControl(keyAlt int)

[inline]
pub fn set_camera_alt_control(keyAlt int) {
	C.SetCameraAltControl(keyAlt)
}

fn C.SetCameraSmoothZoomControl(keySmoothZoom int)

[inline]
pub fn set_camera_smooth_zoom_control(keySmoothZoom int) {
	C.SetCameraSmoothZoomControl(keySmoothZoom)
}

fn C.SetCameraMoveControls(keyFront int, keyBack int, keyRight int, keyLeft int, keyUp int, keyDown int)

[inline]
pub fn set_camera_move_controls(keyFront int, keyBack int, keyRight int, keyLeft int, keyUp int, keyDown int) {
	C.SetCameraMoveControls(keyFront, keyBack, keyRight, keyLeft, keyUp, keyDown)
}

fn C.SetShapesTexture(texture C.Texture2D, source C.Rectangle)

[inline]
pub fn set_shapes_texture(texture C.Texture2D, source C.Rectangle) {
	C.SetShapesTexture(texture, source)
}

fn C.DrawPixel(posX int, posY int, color C.Color)

[inline]
pub fn draw_pixel(posX int, posY int, color C.Color) {
	C.DrawPixel(posX, posY, color)
}

fn C.DrawPixelV(position C.Vector2, color C.Color)

[inline]
pub fn draw_pixel_v(position C.Vector2, color C.Color) {
	C.DrawPixelV(position, color)
}

fn C.DrawLine(startPosX int, startPosY int, endPosX int, endPosY int, color C.Color)

[inline]
pub fn draw_line(startPosX int, startPosY int, endPosX int, endPosY int, color C.Color) {
	C.DrawLine(startPosX, startPosY, endPosX, endPosY, color)
}

fn C.DrawLineV(startPos C.Vector2, endPos C.Vector2, color C.Color)

[inline]
pub fn draw_line_v(startPos C.Vector2, endPos C.Vector2, color C.Color) {
	C.DrawLineV(startPos, endPos, color)
}

fn C.DrawLineEx(startPos C.Vector2, endPos C.Vector2, thick f32, color C.Color)

[inline]
pub fn draw_line_ex(startPos C.Vector2, endPos C.Vector2, thick f32, color C.Color) {
	C.DrawLineEx(startPos, endPos, thick, color)
}

fn C.DrawLineBezier(startPos C.Vector2, endPos C.Vector2, thick f32, color C.Color)

[inline]
pub fn draw_line_bezier(startPos C.Vector2, endPos C.Vector2, thick f32, color C.Color) {
	C.DrawLineBezier(startPos, endPos, thick, color)
}

fn C.DrawLineBezierQuad(startPos C.Vector2, endPos C.Vector2, controlPos C.Vector2, thick f32, color C.Color)

[inline]
pub fn draw_line_bezier_quad(startPos C.Vector2, endPos C.Vector2, controlPos C.Vector2, thick f32, color C.Color) {
	C.DrawLineBezierQuad(startPos, endPos, controlPos, thick, color)
}

fn C.DrawLineStrip(points &C.Vector2, pointsCount int, color C.Color)

[inline]
pub fn draw_line_strip(points &C.Vector2, pointsCount int, color C.Color) {
	C.DrawLineStrip(points, pointsCount, color)
}

fn C.DrawCircle(centerX int, centerY int, radius f32, color C.Color)

[inline]
pub fn draw_circle(centerX int, centerY int, radius f32, color C.Color) {
	C.DrawCircle(centerX, centerY, radius, color)
}

fn C.DrawCircleSector(center C.Vector2, radius f32, startAngle f32, endAngle f32, segments int, color C.Color)

[inline]
pub fn draw_circle_sector(center C.Vector2, radius f32, startAngle f32, endAngle f32, segments int, color C.Color) {
	C.DrawCircleSector(center, radius, startAngle, endAngle, segments, color)
}

fn C.DrawCircleSectorLines(center C.Vector2, radius f32, startAngle f32, endAngle f32, segments int, color C.Color)

[inline]
pub fn draw_circle_sector_lines(center C.Vector2, radius f32, startAngle f32, endAngle f32, segments int, color C.Color) {
	C.DrawCircleSectorLines(center, radius, startAngle, endAngle, segments, color)
}

fn C.DrawCircleGradient(centerX int, centerY int, radius f32, color1 C.Color, color2 C.Color)

[inline]
pub fn draw_circle_gradient(centerX int, centerY int, radius f32, color1 C.Color, color2 C.Color) {
	C.DrawCircleGradient(centerX, centerY, radius, color1, color2)
}

fn C.DrawCircleV(center C.Vector2, radius f32, color C.Color)

[inline]
pub fn draw_circle_v(center C.Vector2, radius f32, color C.Color) {
	C.DrawCircleV(center, radius, color)
}

fn C.DrawCircleLines(centerX int, centerY int, radius f32, color C.Color)

[inline]
pub fn draw_circle_lines(centerX int, centerY int, radius f32, color C.Color) {
	C.DrawCircleLines(centerX, centerY, radius, color)
}

fn C.DrawEllipse(centerX int, centerY int, radiusH f32, radiusV f32, color C.Color)

[inline]
pub fn draw_ellipse(centerX int, centerY int, radiusH f32, radiusV f32, color C.Color) {
	C.DrawEllipse(centerX, centerY, radiusH, radiusV, color)
}

fn C.DrawEllipseLines(centerX int, centerY int, radiusH f32, radiusV f32, color C.Color)

[inline]
pub fn draw_ellipse_lines(centerX int, centerY int, radiusH f32, radiusV f32, color C.Color) {
	C.DrawEllipseLines(centerX, centerY, radiusH, radiusV, color)
}

fn C.DrawRing(center C.Vector2, innerRadius f32, outerRadius f32, startAngle f32, endAngle f32, segments int, color C.Color)

[inline]
pub fn draw_ring(center C.Vector2, innerRadius f32, outerRadius f32, startAngle f32, endAngle f32, segments int, color C.Color) {
	C.DrawRing(center, innerRadius, outerRadius, startAngle, endAngle, segments, color)
}

fn C.DrawRingLines(center C.Vector2, innerRadius f32, outerRadius f32, startAngle f32, endAngle f32, segments int, color C.Color)

[inline]
pub fn draw_ring_lines(center C.Vector2, innerRadius f32, outerRadius f32, startAngle f32, endAngle f32, segments int, color C.Color) {
	C.DrawRingLines(center, innerRadius, outerRadius, startAngle, endAngle, segments,
		color)
}

fn C.DrawRectangle(posX int, posY int, width int, height int, color C.Color)

[inline]
pub fn draw_rectangle(posX int, posY int, width int, height int, color C.Color) {
	C.DrawRectangle(posX, posY, width, height, color)
}

fn C.DrawRectangleV(position C.Vector2, size C.Vector2, color C.Color)

[inline]
pub fn draw_rectangle_v(position C.Vector2, size C.Vector2, color C.Color) {
	C.DrawRectangleV(position, size, color)
}

fn C.DrawRectangleRec(rec C.Rectangle, color C.Color)

[inline]
pub fn draw_rectangle_rec(rec C.Rectangle, color C.Color) {
	C.DrawRectangleRec(rec, color)
}

fn C.DrawRectanglePro(rec C.Rectangle, origin C.Vector2, rotation f32, color C.Color)

[inline]
pub fn draw_rectangle_pro(rec C.Rectangle, origin C.Vector2, rotation f32, color C.Color) {
	C.DrawRectanglePro(rec, origin, rotation, color)
}

fn C.DrawRectangleGradientV(posX int, posY int, width int, height int, color1 C.Color, color2 C.Color)

[inline]
pub fn draw_rectangle_gradient_v(posX int, posY int, width int, height int, color1 C.Color, color2 C.Color) {
	C.DrawRectangleGradientV(posX, posY, width, height, color1, color2)
}

fn C.DrawRectangleGradientH(posX int, posY int, width int, height int, color1 C.Color, color2 C.Color)

[inline]
pub fn draw_rectangle_gradient_h(posX int, posY int, width int, height int, color1 C.Color, color2 C.Color) {
	C.DrawRectangleGradientH(posX, posY, width, height, color1, color2)
}

fn C.DrawRectangleGradientEx(rec C.Rectangle, col1 C.Color, col2 C.Color, col3 C.Color, col4 C.Color)

[inline]
pub fn draw_rectangle_gradient_ex(rec C.Rectangle, col1 C.Color, col2 C.Color, col3 C.Color, col4 C.Color) {
	C.DrawRectangleGradientEx(rec, col1, col2, col3, col4)
}

fn C.DrawRectangleLines(posX int, posY int, width int, height int, color C.Color)

[inline]
pub fn draw_rectangle_lines(posX int, posY int, width int, height int, color C.Color) {
	C.DrawRectangleLines(posX, posY, width, height, color)
}

fn C.DrawRectangleLinesEx(rec C.Rectangle, lineThick int, color C.Color)

[inline]
pub fn draw_rectangle_lines_ex(rec C.Rectangle, lineThick int, color C.Color) {
	C.DrawRectangleLinesEx(rec, lineThick, color)
}

fn C.DrawRectangleRounded(rec C.Rectangle, roundness f32, segments int, color C.Color)

[inline]
pub fn draw_rectangle_rounded(rec C.Rectangle, roundness f32, segments int, color C.Color) {
	C.DrawRectangleRounded(rec, roundness, segments, color)
}

fn C.DrawRectangleRoundedLines(rec C.Rectangle, roundness f32, segments int, lineThick int, color C.Color)

[inline]
pub fn draw_rectangle_rounded_lines(rec C.Rectangle, roundness f32, segments int, lineThick int, color C.Color) {
	C.DrawRectangleRoundedLines(rec, roundness, segments, lineThick, color)
}

fn C.DrawTriangle(v1 C.Vector2, v2 C.Vector2, v3 C.Vector2, color C.Color)

[inline]
pub fn draw_triangle(v1 C.Vector2, v2 C.Vector2, v3 C.Vector2, color C.Color) {
	C.DrawTriangle(v1, v2, v3, color)
}

fn C.DrawTriangleLines(v1 C.Vector2, v2 C.Vector2, v3 C.Vector2, color C.Color)

[inline]
pub fn draw_triangle_lines(v1 C.Vector2, v2 C.Vector2, v3 C.Vector2, color C.Color) {
	C.DrawTriangleLines(v1, v2, v3, color)
}

fn C.DrawTriangleFan(points &C.Vector2, pointsCount int, color C.Color)

[inline]
pub fn draw_triangle_fan(points &C.Vector2, pointsCount int, color C.Color) {
	C.DrawTriangleFan(points, pointsCount, color)
}

fn C.DrawTriangleStrip(points &C.Vector2, pointsCount int, color C.Color)

[inline]
pub fn draw_triangle_strip(points &C.Vector2, pointsCount int, color C.Color) {
	C.DrawTriangleStrip(points, pointsCount, color)
}

fn C.DrawPoly(center C.Vector2, sides int, radius f32, rotation f32, color C.Color)

[inline]
pub fn draw_poly(center C.Vector2, sides int, radius f32, rotation f32, color C.Color) {
	C.DrawPoly(center, sides, radius, rotation, color)
}

fn C.DrawPolyLines(center C.Vector2, sides int, radius f32, rotation f32, color C.Color)

[inline]
pub fn draw_poly_lines(center C.Vector2, sides int, radius f32, rotation f32, color C.Color) {
	C.DrawPolyLines(center, sides, radius, rotation, color)
}

fn C.CheckCollisionRecs(rec1 C.Rectangle, rec2 C.Rectangle) bool

[inline]
pub fn check_collision_recs(rec1 C.Rectangle, rec2 C.Rectangle) bool {
	return C.CheckCollisionRecs(rec1, rec2)
}

fn C.CheckCollisionCircles(center1 C.Vector2, radius1 f32, center2 C.Vector2, radius2 f32) bool

[inline]
pub fn check_collision_circles(center1 C.Vector2, radius1 f32, center2 C.Vector2, radius2 f32) bool {
	return C.CheckCollisionCircles(center1, radius1, center2, radius2)
}

fn C.CheckCollisionCircleRec(center C.Vector2, radius f32, rec C.Rectangle) bool

[inline]
pub fn check_collision_circle_rec(center C.Vector2, radius f32, rec C.Rectangle) bool {
	return C.CheckCollisionCircleRec(center, radius, rec)
}

fn C.CheckCollisionPointRec(point C.Vector2, rec C.Rectangle) bool

[inline]
pub fn check_collision_point_rec(point C.Vector2, rec C.Rectangle) bool {
	return C.CheckCollisionPointRec(point, rec)
}

fn C.CheckCollisionPointCircle(point C.Vector2, center C.Vector2, radius f32) bool

[inline]
pub fn check_collision_point_circle(point C.Vector2, center C.Vector2, radius f32) bool {
	return C.CheckCollisionPointCircle(point, center, radius)
}

fn C.CheckCollisionPointTriangle(point C.Vector2, p1 C.Vector2, p2 C.Vector2, p3 C.Vector2) bool

[inline]
pub fn check_collision_point_triangle(point C.Vector2, p1 C.Vector2, p2 C.Vector2, p3 C.Vector2) bool {
	return C.CheckCollisionPointTriangle(point, p1, p2, p3)
}

fn C.CheckCollisionLines(startPos1 C.Vector2, endPos1 C.Vector2, startPos2 C.Vector2, endPos2 C.Vector2, collisionPoint &C.Vector2) bool

[inline]
pub fn check_collision_lines(startPos1 C.Vector2, endPos1 C.Vector2, startPos2 C.Vector2, endPos2 C.Vector2, collisionPoint &C.Vector2) bool {
	return C.CheckCollisionLines(startPos1, endPos1, startPos2, endPos2, collisionPoint)
}

fn C.GetCollisionRec(rec1 C.Rectangle, rec2 C.Rectangle) C.Rectangle

[inline]
pub fn get_collision_rec(rec1 C.Rectangle, rec2 C.Rectangle) C.Rectangle {
	return C.GetCollisionRec(rec1, rec2)
}

fn C.LoadImage(fileName &char) C.Image

[inline]
pub fn load_image(fileName string) C.Image {
	return C.LoadImage(fileName.str)
}

fn C.LoadImageRaw(fileName &char, width int, height int, format int, headerSize int) C.Image

[inline]
pub fn load_image_raw(fileName string, width int, height int, format int, headerSize int) C.Image {
	return C.LoadImageRaw(fileName.str, width, height, format, headerSize)
}

fn C.LoadImageAnim(fileName &char, frames &int) C.Image

[inline]
pub fn load_image_anim(fileName string, frames &int) C.Image {
	return C.LoadImageAnim(fileName.str, frames)
}

fn C.LoadImageFromMemory(fileType &char, fileData &char, dataSize int) C.Image

[inline]
pub fn load_image_from_memory(fileType string, fileData string, dataSize int) C.Image {
	return C.LoadImageFromMemory(fileType.str, fileData.str, dataSize)
}

fn C.UnloadImage(image C.Image)

[inline]
pub fn unload_image(image C.Image) {
	C.UnloadImage(image)
}

fn C.ExportImage(image C.Image, fileName &char) bool

[inline]
pub fn export_image(image C.Image, fileName string) bool {
	return C.ExportImage(image, fileName.str)
}

fn C.ExportImageAsCode(image C.Image, fileName &char) bool

[inline]
pub fn export_image_as_code(image C.Image, fileName string) bool {
	return C.ExportImageAsCode(image, fileName.str)
}

fn C.GenImageColor(width int, height int, color C.Color) C.Image

[inline]
pub fn gen_image_color(width int, height int, color C.Color) C.Image {
	return C.GenImageColor(width, height, color)
}

fn C.GenImageGradientV(width int, height int, top C.Color, bottom C.Color) C.Image

[inline]
pub fn gen_image_gradient_v(width int, height int, top C.Color, bottom C.Color) C.Image {
	return C.GenImageGradientV(width, height, top, bottom)
}

fn C.GenImageGradientH(width int, height int, left C.Color, right C.Color) C.Image

[inline]
pub fn gen_image_gradient_h(width int, height int, left C.Color, right C.Color) C.Image {
	return C.GenImageGradientH(width, height, left, right)
}

fn C.GenImageGradientRadial(width int, height int, density f32, inner C.Color, outer C.Color) C.Image

[inline]
pub fn gen_image_gradient_radial(width int, height int, density f32, inner C.Color, outer C.Color) C.Image {
	return C.GenImageGradientRadial(width, height, density, inner, outer)
}

fn C.GenImageChecked(width int, height int, checksX int, checksY int, col1 C.Color, col2 C.Color) C.Image

[inline]
pub fn gen_image_checked(width int, height int, checksX int, checksY int, col1 C.Color, col2 C.Color) C.Image {
	return C.GenImageChecked(width, height, checksX, checksY, col1, col2)
}

fn C.GenImageWhiteNoise(width int, height int, factor f32) C.Image

[inline]
pub fn gen_image_white_noise(width int, height int, factor f32) C.Image {
	return C.GenImageWhiteNoise(width, height, factor)
}

fn C.GenImagePerlinNoise(width int, height int, offsetX int, offsetY int, scale f32) C.Image

[inline]
pub fn gen_image_perlin_noise(width int, height int, offsetX int, offsetY int, scale f32) C.Image {
	return C.GenImagePerlinNoise(width, height, offsetX, offsetY, scale)
}

fn C.GenImageCellular(width int, height int, tileSize int) C.Image

[inline]
pub fn gen_image_cellular(width int, height int, tileSize int) C.Image {
	return C.GenImageCellular(width, height, tileSize)
}

fn C.ImageCopy(image C.Image) C.Image

[inline]
pub fn image_copy(image C.Image) C.Image {
	return C.ImageCopy(image)
}

fn C.ImageFromImage(image C.Image, rec C.Rectangle) C.Image

[inline]
pub fn image_from_image(image C.Image, rec C.Rectangle) C.Image {
	return C.ImageFromImage(image, rec)
}

fn C.ImageText(text &char, fontSize int, color C.Color) C.Image

[inline]
pub fn image_text(text string, fontSize int, color C.Color) C.Image {
	return C.ImageText(text.str, fontSize, color)
}

fn C.ImageTextEx(font C.Font, text &char, fontSize f32, spacing f32, tint C.Color) C.Image

[inline]
pub fn image_text_ex(font C.Font, text string, fontSize f32, spacing f32, tint C.Color) C.Image {
	return C.ImageTextEx(font, text.str, fontSize, spacing, tint)
}

fn C.ImageFormat(image &C.Image, newFormat int)

[inline]
pub fn image_format(image &C.Image, newFormat int) {
	C.ImageFormat(image, newFormat)
}

fn C.ImageToPOT(image &C.Image, fill C.Color)

[inline]
pub fn image_to_pot(image &C.Image, fill C.Color) {
	C.ImageToPOT(image, fill)
}

fn C.ImageCrop(image &C.Image, crop C.Rectangle)

[inline]
pub fn image_crop(image &C.Image, crop C.Rectangle) {
	C.ImageCrop(image, crop)
}

fn C.ImageAlphaCrop(image &C.Image, threshold f32)

[inline]
pub fn image_alpha_crop(image &C.Image, threshold f32) {
	C.ImageAlphaCrop(image, threshold)
}

fn C.ImageAlphaClear(image &C.Image, color C.Color, threshold f32)

[inline]
pub fn image_alpha_clear(image &C.Image, color C.Color, threshold f32) {
	C.ImageAlphaClear(image, color, threshold)
}

fn C.ImageAlphaMask(image &C.Image, alphaMask C.Image)

[inline]
pub fn image_alpha_mask(image &C.Image, alphaMask C.Image) {
	C.ImageAlphaMask(image, alphaMask)
}

fn C.ImageAlphaPremultiply(image &C.Image)

[inline]
pub fn image_alpha_premultiply(image &C.Image) {
	C.ImageAlphaPremultiply(image)
}

fn C.ImageResize(image &C.Image, newWidth int, newHeight int)

[inline]
pub fn image_resize(image &C.Image, newWidth int, newHeight int) {
	C.ImageResize(image, newWidth, newHeight)
}

fn C.ImageResizeNN(image &C.Image, newWidth int, newHeight int)

[inline]
pub fn image_resize_nn(image &C.Image, newWidth int, newHeight int) {
	C.ImageResizeNN(image, newWidth, newHeight)
}

fn C.ImageResizeCanvas(image &C.Image, newWidth int, newHeight int, offsetX int, offsetY int, fill C.Color)

[inline]
pub fn image_resize_canvas(image &C.Image, newWidth int, newHeight int, offsetX int, offsetY int, fill C.Color) {
	C.ImageResizeCanvas(image, newWidth, newHeight, offsetX, offsetY, fill)
}

fn C.ImageMipmaps(image &C.Image)

[inline]
pub fn image_mipmaps(image &C.Image) {
	C.ImageMipmaps(image)
}

fn C.ImageDither(image &C.Image, rBpp int, gBpp int, bBpp int, aBpp int)

[inline]
pub fn image_dither(image &C.Image, rBpp int, gBpp int, bBpp int, aBpp int) {
	C.ImageDither(image, rBpp, gBpp, bBpp, aBpp)
}

fn C.ImageFlipVertical(image &C.Image)

[inline]
pub fn image_flip_vertical(image &C.Image) {
	C.ImageFlipVertical(image)
}

fn C.ImageFlipHorizontal(image &C.Image)

[inline]
pub fn image_flip_horizontal(image &C.Image) {
	C.ImageFlipHorizontal(image)
}

fn C.ImageRotateCW(image &C.Image)

[inline]
pub fn image_rotate_cw(image &C.Image) {
	C.ImageRotateCW(image)
}

fn C.ImageRotateCCW(image &C.Image)

[inline]
pub fn image_rotate_ccw(image &C.Image) {
	C.ImageRotateCCW(image)
}

fn C.ImageColorTint(image &C.Image, color C.Color)

[inline]
pub fn image_color_tint(image &C.Image, color C.Color) {
	C.ImageColorTint(image, color)
}

fn C.ImageColorInvert(image &C.Image)

[inline]
pub fn image_color_invert(image &C.Image) {
	C.ImageColorInvert(image)
}

fn C.ImageColorGrayscale(image &C.Image)

[inline]
pub fn image_color_grayscale(image &C.Image) {
	C.ImageColorGrayscale(image)
}

fn C.ImageColorContrast(image &C.Image, contrast f32)

[inline]
pub fn image_color_contrast(image &C.Image, contrast f32) {
	C.ImageColorContrast(image, contrast)
}

fn C.ImageColorBrightness(image &C.Image, brightness int)

[inline]
pub fn image_color_brightness(image &C.Image, brightness int) {
	C.ImageColorBrightness(image, brightness)
}

fn C.ImageColorReplace(image &C.Image, color C.Color, replace C.Color)

[inline]
pub fn image_color_replace(image &C.Image, color C.Color, replace C.Color) {
	C.ImageColorReplace(image, color, replace)
}

fn C.LoadImageColors(image C.Image) &C.Color

[inline]
pub fn load_image_colors(image C.Image) &C.Color {
	return C.LoadImageColors(image)
}

fn C.LoadImagePalette(image C.Image, maxPaletteSize int, colorsCount &int) &C.Color

[inline]
pub fn load_image_palette(image C.Image, maxPaletteSize int, colorsCount &int) &C.Color {
	return C.LoadImagePalette(image, maxPaletteSize, colorsCount)
}

fn C.UnloadImageColors(colors &C.Color)

[inline]
pub fn unload_image_colors(colors &C.Color) {
	C.UnloadImageColors(colors)
}

fn C.UnloadImagePalette(colors &C.Color)

[inline]
pub fn unload_image_palette(colors &C.Color) {
	C.UnloadImagePalette(colors)
}

fn C.GetImageAlphaBorder(image C.Image, threshold f32) C.Rectangle

[inline]
pub fn get_image_alpha_border(image C.Image, threshold f32) C.Rectangle {
	return C.GetImageAlphaBorder(image, threshold)
}

fn C.ImageClearBackground(dst &C.Image, color C.Color)

[inline]
pub fn image_clear_background(dst &C.Image, color C.Color) {
	C.ImageClearBackground(dst, color)
}

fn C.ImageDrawPixel(dst &C.Image, posX int, posY int, color C.Color)

[inline]
pub fn image_draw_pixel(dst &C.Image, posX int, posY int, color C.Color) {
	C.ImageDrawPixel(dst, posX, posY, color)
}

fn C.ImageDrawPixelV(dst &C.Image, position C.Vector2, color C.Color)

[inline]
pub fn image_draw_pixel_v(dst &C.Image, position C.Vector2, color C.Color) {
	C.ImageDrawPixelV(dst, position, color)
}

fn C.ImageDrawLine(dst &C.Image, startPosX int, startPosY int, endPosX int, endPosY int, color C.Color)

[inline]
pub fn image_draw_line(dst &C.Image, startPosX int, startPosY int, endPosX int, endPosY int, color C.Color) {
	C.ImageDrawLine(dst, startPosX, startPosY, endPosX, endPosY, color)
}

fn C.ImageDrawLineV(dst &C.Image, start C.Vector2, end C.Vector2, color C.Color)

[inline]
pub fn image_draw_line_v(dst &C.Image, start C.Vector2, end C.Vector2, color C.Color) {
	C.ImageDrawLineV(dst, start, end, color)
}

fn C.ImageDrawCircle(dst &C.Image, centerX int, centerY int, radius int, color C.Color)

[inline]
pub fn image_draw_circle(dst &C.Image, centerX int, centerY int, radius int, color C.Color) {
	C.ImageDrawCircle(dst, centerX, centerY, radius, color)
}

fn C.ImageDrawCircleV(dst &C.Image, center C.Vector2, radius int, color C.Color)

[inline]
pub fn image_draw_circle_v(dst &C.Image, center C.Vector2, radius int, color C.Color) {
	C.ImageDrawCircleV(dst, center, radius, color)
}

fn C.ImageDrawRectangle(dst &C.Image, posX int, posY int, width int, height int, color C.Color)

[inline]
pub fn image_draw_rectangle(dst &C.Image, posX int, posY int, width int, height int, color C.Color) {
	C.ImageDrawRectangle(dst, posX, posY, width, height, color)
}

fn C.ImageDrawRectangleV(dst &C.Image, position C.Vector2, size C.Vector2, color C.Color)

[inline]
pub fn image_draw_rectangle_v(dst &C.Image, position C.Vector2, size C.Vector2, color C.Color) {
	C.ImageDrawRectangleV(dst, position, size, color)
}

fn C.ImageDrawRectangleRec(dst &C.Image, rec C.Rectangle, color C.Color)

[inline]
pub fn image_draw_rectangle_rec(dst &C.Image, rec C.Rectangle, color C.Color) {
	C.ImageDrawRectangleRec(dst, rec, color)
}

fn C.ImageDrawRectangleLines(dst &C.Image, rec C.Rectangle, thick int, color C.Color)

[inline]
pub fn image_draw_rectangle_lines(dst &C.Image, rec C.Rectangle, thick int, color C.Color) {
	C.ImageDrawRectangleLines(dst, rec, thick, color)
}

fn C.ImageDraw(dst &C.Image, src C.Image, srcRec C.Rectangle, dstRec C.Rectangle, tint C.Color)

[inline]
pub fn image_draw(dst &C.Image, src C.Image, srcRec C.Rectangle, dstRec C.Rectangle, tint C.Color) {
	C.ImageDraw(dst, src, srcRec, dstRec, tint)
}

fn C.ImageDrawText(dst &C.Image, text &char, posX int, posY int, fontSize int, color C.Color)

[inline]
pub fn image_draw_text(dst &C.Image, text string, posX int, posY int, fontSize int, color C.Color) {
	C.ImageDrawText(dst, text.str, posX, posY, fontSize, color)
}

fn C.ImageDrawTextEx(dst &C.Image, font C.Font, text &char, position C.Vector2, fontSize f32, spacing f32, tint C.Color)

[inline]
pub fn image_draw_text_ex(dst &C.Image, font C.Font, text string, position C.Vector2, fontSize f32, spacing f32, tint C.Color) {
	C.ImageDrawTextEx(dst, font, text.str, position, fontSize, spacing, tint)
}

fn C.LoadTexture(fileName &char) C.Texture2D

[inline]
pub fn load_texture(fileName string) C.Texture2D {
	return C.LoadTexture(fileName.str)
}

fn C.LoadTextureFromImage(image C.Image) C.Texture2D

[inline]
pub fn load_texture_from_image(image C.Image) C.Texture2D {
	return C.LoadTextureFromImage(image)
}

fn C.LoadTextureCubemap(image C.Image, layout int) C.TextureCubemap

[inline]
pub fn load_texture_cubemap(image C.Image, layout int) C.TextureCubemap {
	return C.LoadTextureCubemap(image, layout)
}

fn C.LoadRenderTexture(width int, height int) C.RenderTexture2D

[inline]
pub fn load_render_texture(width int, height int) C.RenderTexture2D {
	return C.LoadRenderTexture(width, height)
}

fn C.UnloadTexture(texture C.Texture2D)

[inline]
pub fn unload_texture(texture C.Texture2D) {
	C.UnloadTexture(texture)
}

fn C.UnloadRenderTexture(target C.RenderTexture2D)

[inline]
pub fn unload_render_texture(target C.RenderTexture2D) {
	C.UnloadRenderTexture(target)
}

fn C.UpdateTexture(texture C.Texture2D, pixels voidptr)

[inline]
pub fn update_texture(texture C.Texture2D, pixels voidptr) {
	C.UpdateTexture(texture, pixels)
}

fn C.UpdateTextureRec(texture C.Texture2D, rec C.Rectangle, pixels voidptr)

[inline]
pub fn update_texture_rec(texture C.Texture2D, rec C.Rectangle, pixels voidptr) {
	C.UpdateTextureRec(texture, rec, pixels)
}

fn C.GetTextureData(texture C.Texture2D) C.Image

[inline]
pub fn get_texture_data(texture C.Texture2D) C.Image {
	return C.GetTextureData(texture)
}

fn C.GetScreenData() C.Image

[inline]
pub fn get_screen_data() C.Image {
	return C.GetScreenData()
}

fn C.GenTextureMipmaps(texture &C.Texture2D)

[inline]
pub fn gen_texture_mipmaps(texture &C.Texture2D) {
	C.GenTextureMipmaps(texture)
}

fn C.SetTextureFilter(texture C.Texture2D, filter int)

[inline]
pub fn set_texture_filter(texture C.Texture2D, filter int) {
	C.SetTextureFilter(texture, filter)
}

fn C.SetTextureWrap(texture C.Texture2D, wrap int)

[inline]
pub fn set_texture_wrap(texture C.Texture2D, wrap int) {
	C.SetTextureWrap(texture, wrap)
}

fn C.DrawTexture(texture C.Texture2D, posX int, posY int, tint C.Color)

[inline]
pub fn draw_texture(texture C.Texture2D, posX int, posY int, tint C.Color) {
	C.DrawTexture(texture, posX, posY, tint)
}

fn C.DrawTextureV(texture C.Texture2D, position C.Vector2, tint C.Color)

[inline]
pub fn draw_texture_v(texture C.Texture2D, position C.Vector2, tint C.Color) {
	C.DrawTextureV(texture, position, tint)
}

fn C.DrawTextureEx(texture C.Texture2D, position C.Vector2, rotation f32, scale f32, tint C.Color)

[inline]
pub fn draw_texture_ex(texture C.Texture2D, position C.Vector2, rotation f32, scale f32, tint C.Color) {
	C.DrawTextureEx(texture, position, rotation, scale, tint)
}

fn C.DrawTextureRec(texture C.Texture2D, source C.Rectangle, position C.Vector2, tint C.Color)

[inline]
pub fn draw_texture_rec(texture C.Texture2D, source C.Rectangle, position C.Vector2, tint C.Color) {
	C.DrawTextureRec(texture, source, position, tint)
}

fn C.DrawTextureQuad(texture C.Texture2D, tiling C.Vector2, offset C.Vector2, quad C.Rectangle, tint C.Color)

[inline]
pub fn draw_texture_quad(texture C.Texture2D, tiling C.Vector2, offset C.Vector2, quad C.Rectangle, tint C.Color) {
	C.DrawTextureQuad(texture, tiling, offset, quad, tint)
}

fn C.DrawTextureTiled(texture C.Texture2D, source C.Rectangle, dest C.Rectangle, origin C.Vector2, rotation f32, scale f32, tint C.Color)

[inline]
pub fn draw_texture_tiled(texture C.Texture2D, source C.Rectangle, dest C.Rectangle, origin C.Vector2, rotation f32, scale f32, tint C.Color) {
	C.DrawTextureTiled(texture, source, dest, origin, rotation, scale, tint)
}

fn C.DrawTexturePro(texture C.Texture2D, source C.Rectangle, dest C.Rectangle, origin C.Vector2, rotation f32, tint C.Color)

[inline]
pub fn draw_texture_pro(texture C.Texture2D, source C.Rectangle, dest C.Rectangle, origin C.Vector2, rotation f32, tint C.Color) {
	C.DrawTexturePro(texture, source, dest, origin, rotation, tint)
}

fn C.DrawTextureNPatch(texture C.Texture2D, nPatchInfo C.NPatchInfo, dest C.Rectangle, origin C.Vector2, rotation f32, tint C.Color)

[inline]
pub fn draw_texture_npatch(texture C.Texture2D, nPatchInfo C.NPatchInfo, dest C.Rectangle, origin C.Vector2, rotation f32, tint C.Color) {
	C.DrawTextureNPatch(texture, nPatchInfo, dest, origin, rotation, tint)
}

fn C.DrawTexturePoly(texture C.Texture2D, center C.Vector2, points &C.Vector2, texcoords &C.Vector2, pointsCount int, tint C.Color)

[inline]
pub fn draw_texture_poly(texture C.Texture2D, center C.Vector2, points &C.Vector2, texcoords &C.Vector2, pointsCount int, tint C.Color) {
	C.DrawTexturePoly(texture, center, points, texcoords, pointsCount, tint)
}

fn C.Fade(color C.Color, alpha f32) C.Color

[inline]
pub fn fade(color C.Color, alpha f32) C.Color {
	return C.Fade(color, alpha)
}

fn C.ColorToInt(color C.Color) int

[inline]
pub fn color_to_int(color C.Color) int {
	return C.ColorToInt(color)
}

fn C.ColorNormalize(color C.Color) C.Vector4

[inline]
pub fn color_normalize(color C.Color) C.Vector4 {
	return C.ColorNormalize(color)
}

fn C.ColorFromNormalized(normalized C.Vector4) C.Color

[inline]
pub fn color_from_normalized(normalized C.Vector4) C.Color {
	return C.ColorFromNormalized(normalized)
}

fn C.ColorToHSV(color C.Color) C.Vector3

[inline]
pub fn color_to_hsv(color C.Color) C.Vector3 {
	return C.ColorToHSV(color)
}

fn C.ColorFromHSV(hue f32, saturation f32, value f32) C.Color

[inline]
pub fn color_from_hsv(hue f32, saturation f32, value f32) C.Color {
	return C.ColorFromHSV(hue, saturation, value)
}

fn C.ColorAlpha(color C.Color, alpha f32) C.Color

[inline]
pub fn color_alpha(color C.Color, alpha f32) C.Color {
	return C.ColorAlpha(color, alpha)
}

fn C.ColorAlphaBlend(dst C.Color, src C.Color, tint C.Color) C.Color

[inline]
pub fn color_alpha_blend(dst C.Color, src C.Color, tint C.Color) C.Color {
	return C.ColorAlphaBlend(dst, src, tint)
}

fn C.GetColor(hexValue int) C.Color

[inline]
pub fn get_color(hexValue int) C.Color {
	return C.GetColor(hexValue)
}

fn C.GetPixelColor(srcPtr voidptr, format int) C.Color

[inline]
pub fn get_pixel_color(srcPtr voidptr, format int) C.Color {
	return C.GetPixelColor(srcPtr, format)
}

fn C.SetPixelColor(dstPtr voidptr, color C.Color, format int)

[inline]
pub fn set_pixel_color(dstPtr voidptr, color C.Color, format int) {
	C.SetPixelColor(dstPtr, color, format)
}

fn C.GetPixelDataSize(width int, height int, format int) int

[inline]
pub fn get_pixel_data_size(width int, height int, format int) int {
	return C.GetPixelDataSize(width, height, format)
}

fn C.GetFontDefault() C.Font

[inline]
pub fn get_font_default() C.Font {
	return C.GetFontDefault()
}

fn C.LoadFont(fileName &char) C.Font

[inline]
pub fn load_font(fileName string) C.Font {
	return C.LoadFont(fileName.str)
}

fn C.LoadFontEx(fileName &char, fontSize int, fontChars &int, charsCount int) C.Font

[inline]
pub fn load_font_ex(fileName string, fontSize int, fontChars &int, charsCount int) C.Font {
	return C.LoadFontEx(fileName.str, fontSize, fontChars, charsCount)
}

fn C.LoadFontFromImage(image C.Image, key C.Color, firstChar int) C.Font

[inline]
pub fn load_font_from_image(image C.Image, key C.Color, firstChar int) C.Font {
	return C.LoadFontFromImage(image, key, firstChar)
}

fn C.LoadFontFromMemory(fileType &char, fileData &char, dataSize int, fontSize int, fontChars &int, charsCount int) C.Font

[inline]
pub fn load_font_from_memory(fileType string, fileData string, dataSize int, fontSize int, fontChars &int, charsCount int) C.Font {
	return C.LoadFontFromMemory(fileType.str, fileData.str, dataSize, fontSize, fontChars,
		charsCount)
}

fn C.LoadFontData(fileData &char, dataSize int, fontSize int, fontChars &int, charsCount int, type_ int) &C.CharInfo

[inline]
pub fn load_font_data(fileData string, dataSize int, fontSize int, fontChars &int, charsCount int, type_ int) &C.CharInfo {
	return C.LoadFontData(fileData.str, dataSize, fontSize, fontChars, charsCount, type_)
}

fn C.GenImageFontAtlas(chars &C.CharInfo, recs &&C.Rectangle, charsCount int, fontSize int, padding int, packMethod int) C.Image

[inline]
pub fn gen_image_font_atlas(chars &C.CharInfo, recs &&C.Rectangle, charsCount int, fontSize int, padding int, packMethod int) C.Image {
	return C.GenImageFontAtlas(chars, recs, charsCount, fontSize, padding, packMethod)
}

fn C.UnloadFontData(chars &C.CharInfo, charsCount int)

[inline]
pub fn unload_font_data(chars &C.CharInfo, charsCount int) {
	C.UnloadFontData(chars, charsCount)
}

fn C.UnloadFont(font C.Font)

[inline]
pub fn unload_font(font C.Font) {
	C.UnloadFont(font)
}

fn C.DrawFPS(posX int, posY int)

[inline]
pub fn draw_fps(posX int, posY int) {
	C.DrawFPS(posX, posY)
}

fn C.DrawText(text &char, posX int, posY int, fontSize int, color C.Color)

[inline]
pub fn draw_text(text string, posX int, posY int, fontSize int, color C.Color) {
	C.DrawText(text.str, posX, posY, fontSize, color)
}

fn C.DrawTextEx(font C.Font, text &char, position C.Vector2, fontSize f32, spacing f32, tint C.Color) int

[inline]
pub fn draw_text_ex(font C.Font, text string, position C.Vector2, fontSize f32, spacing f32, tint C.Color) int {
	return C.DrawTextEx(font, text.str, position, fontSize, spacing, tint)
}

// fn C.DrawTextEx2(font C.Font, text &char, position C.Vector2, fontSize f32, width f32, tint C.Color) int

// [inline]
// pub fn draw_text_ex2(font C.Font, text string, position C.Vector2, fontSize f32, width f32, tint C.Color) int {
// 	return C.DrawTextEx2(font, text.str, position, fontSize, width, tint)
// }

fn C.DrawTextRec(font C.Font, text &char, rec C.Rectangle, fontSize f32, spacing f32, wordWrap bool, tint C.Color)

[inline]
pub fn draw_text_rec(font C.Font, text string, rec C.Rectangle, fontSize f32, spacing f32, wordWrap bool, tint C.Color) {
	C.DrawTextRec(font, text.str, rec, fontSize, spacing, wordWrap, tint)
}

fn C.DrawTextRecEx(font C.Font, text &char, rec C.Rectangle, fontSize f32, spacing f32, wordWrap bool, tint C.Color, selectStart int, selectLength int, selectTint C.Color, selectBackTint C.Color)

[inline]
pub fn draw_text_rec_ex(font C.Font, text string, rec C.Rectangle, fontSize f32, spacing f32, wordWrap bool, tint C.Color, selectStart int, selectLength int, selectTint C.Color, selectBackTint C.Color) {
	C.DrawTextRecEx(font, text.str, rec, fontSize, spacing, wordWrap, tint, selectStart,
		selectLength, selectTint, selectBackTint)
}

fn C.DrawTextCodepoint(font C.Font, codepoint int, position C.Vector2, fontSize f32, tint C.Color)

[inline]
pub fn draw_text_codepoint(font C.Font, codepoint int, position C.Vector2, fontSize f32, tint C.Color) {
	C.DrawTextCodepoint(font, codepoint, position, fontSize, tint)
}

fn C.MeasureText(text &char, fontSize int) int

[inline]
pub fn measure_text(text string, fontSize int) int {
	return C.MeasureText(text.str, fontSize)
}

fn C.MeasureTextEx(font C.Font, text &char, fontSize f32, spacing f32) C.Vector2

[inline]
pub fn measure_text_ex(font C.Font, text string, fontSize f32, spacing f32) C.Vector2 {
	return C.MeasureTextEx(font, text.str, fontSize, spacing)
}

fn C.GetGlyphIndex(font C.Font, codepoint int) int

[inline]
pub fn get_glyph_index(font C.Font, codepoint int) int {
	return C.GetGlyphIndex(font, codepoint)
}

fn C.TextCopy(dst &char, src &char) int

[inline]
pub fn text_copy(dst string, src string) int {
	return C.TextCopy(dst.str, src.str)
}

fn C.TextIsEqual(text1 &char, text2 &char) bool

[inline]
pub fn text_is_equal(text1 string, text2 string) bool {
	return C.TextIsEqual(text1.str, text2.str)
}

fn C.TextLength(text &char) u32

[inline]
pub fn text_length(text string) u32 {
	return C.TextLength(text.str)
}

fn C.TextSubtext(text &char, position int, length int) &char

[inline]
pub fn text_subtext(text string, position int, length int) string {
	return unsafe { C.TextSubtext(text.str, position, length).vstring() }
}

fn C.TextReplace(text &char, replace &char, by &char) &char

[inline]
pub fn text_replace(text string, replace string, by string) string {
	return unsafe { C.TextReplace(text.str, replace.str, by.str).vstring() }
}

fn C.TextInsert(text &char, insert &char, position int) &char

[inline]
pub fn text_insert(text string, insert string, position int) string {
	return unsafe { C.TextInsert(text.str, insert.str, position).vstring() }
}

fn C.TextJoin(textList &&char, count int, delimiter &char) &char

[inline]
pub fn text_join(textList &&char, count int, delimiter string) string {
	return unsafe { C.TextJoin(textList, count, delimiter.str).vstring() }
}

fn C.TextSplit(text &char, delimiter char, count &int) &&char

[inline]
pub fn text_split(text string, delimiter char, count &int) &&char {
	return C.TextSplit(text.str, delimiter, count)
}

fn C.TextAppend(text &char, append &char, position &int)

[inline]
pub fn text_append(text string, append string, position &int) {
	C.TextAppend(text.str, append.str, position)
}

fn C.TextFindIndex(text &char, find &char) int

[inline]
pub fn text_find_index(text string, find string) int {
	return C.TextFindIndex(text.str, find.str)
}

fn C.TextToUpper(text &char) &char

[inline]
pub fn text_to_upper(text string) string {
	return unsafe { C.TextToUpper(text.str).vstring() }
}

fn C.TextToLower(text &char) &char

[inline]
pub fn text_to_lower(text string) string {
	return unsafe { C.TextToLower(text.str).vstring() }
}

fn C.TextToPascal(text &char) &char

[inline]
pub fn text_to_pascal(text string) string {
	return unsafe { C.TextToPascal(text.str).vstring() }
}

fn C.TextToInteger(text &char) int

[inline]
pub fn text_to_integer(text string) int {
	return C.TextToInteger(text.str)
}

fn C.TextToUtf8(codepoints &int, length int) &char

[inline]
pub fn text_to_utf8(codepoints &int, length int) string {
	return unsafe { C.TextToUtf8(codepoints, length).vstring() }
}

fn C.GetCodepoints(text &char, count &int) &int

[inline]
pub fn get_codepoints(text string, count &int) &int {
	return C.GetCodepoints(text.str, count)
}

fn C.GetCodepointsCount(text &char) int

[inline]
pub fn get_codepoints_count(text string) int {
	return C.GetCodepointsCount(text.str)
}

fn C.GetNextCodepoint(text &char, bytesProcessed &int) int

[inline]
pub fn get_next_codepoint(text string, bytesProcessed &int) int {
	return C.GetNextCodepoint(text.str, bytesProcessed)
}

fn C.CodepointToUtf8(codepoint int, byteLength &int) &char

[inline]
pub fn codepoint_to_utf8(codepoint int, byteLength &int) string {
	return unsafe { C.CodepointToUtf8(codepoint, byteLength).vstring() }
}

fn C.DrawLine3D(startPos C.Vector3, endPos C.Vector3, color C.Color)

[inline]
pub fn draw_line3_d(startPos C.Vector3, endPos C.Vector3, color C.Color) {
	C.DrawLine3D(startPos, endPos, color)
}

fn C.DrawPoint3D(position C.Vector3, color C.Color)

[inline]
pub fn draw_point3_d(position C.Vector3, color C.Color) {
	C.DrawPoint3D(position, color)
}

fn C.DrawCircle3D(center C.Vector3, radius f32, rotationAxis C.Vector3, rotationAngle f32, color C.Color)

[inline]
pub fn draw_circle3_d(center C.Vector3, radius f32, rotationAxis C.Vector3, rotationAngle f32, color C.Color) {
	C.DrawCircle3D(center, radius, rotationAxis, rotationAngle, color)
}

fn C.DrawTriangle3D(v1 C.Vector3, v2 C.Vector3, v3 C.Vector3, color C.Color)

[inline]
pub fn draw_triangle3_d(v1 C.Vector3, v2 C.Vector3, v3 C.Vector3, color C.Color) {
	C.DrawTriangle3D(v1, v2, v3, color)
}

fn C.DrawTriangleStrip3D(points &C.Vector3, pointsCount int, color C.Color)

[inline]
pub fn draw_triangle_strip3_d(points &C.Vector3, pointsCount int, color C.Color) {
	C.DrawTriangleStrip3D(points, pointsCount, color)
}

fn C.DrawCube(position C.Vector3, width f32, height f32, length f32, color C.Color)

[inline]
pub fn draw_cube(position C.Vector3, width f32, height f32, length f32, color C.Color) {
	C.DrawCube(position, width, height, length, color)
}

fn C.DrawCubeV(position C.Vector3, size C.Vector3, color C.Color)

[inline]
pub fn draw_cube_v(position C.Vector3, size C.Vector3, color C.Color) {
	C.DrawCubeV(position, size, color)
}

fn C.DrawCubeWires(position C.Vector3, width f32, height f32, length f32, color C.Color)

[inline]
pub fn draw_cube_wires(position C.Vector3, width f32, height f32, length f32, color C.Color) {
	C.DrawCubeWires(position, width, height, length, color)
}

fn C.DrawCubeWiresV(position C.Vector3, size C.Vector3, color C.Color)

[inline]
pub fn draw_cube_wires_v(position C.Vector3, size C.Vector3, color C.Color) {
	C.DrawCubeWiresV(position, size, color)
}

fn C.DrawCubeTexture(texture C.Texture2D, position C.Vector3, width f32, height f32, length f32, color C.Color)

[inline]
pub fn draw_cube_texture(texture C.Texture2D, position C.Vector3, width f32, height f32, length f32, color C.Color) {
	C.DrawCubeTexture(texture, position, width, height, length, color)
}

fn C.DrawSphere(centerPos C.Vector3, radius f32, color C.Color)

[inline]
pub fn draw_sphere(centerPos C.Vector3, radius f32, color C.Color) {
	C.DrawSphere(centerPos, radius, color)
}

fn C.DrawSphereEx(centerPos C.Vector3, radius f32, rings int, slices int, color C.Color)

[inline]
pub fn draw_sphere_ex(centerPos C.Vector3, radius f32, rings int, slices int, color C.Color) {
	C.DrawSphereEx(centerPos, radius, rings, slices, color)
}

fn C.DrawSphereWires(centerPos C.Vector3, radius f32, rings int, slices int, color C.Color)

[inline]
pub fn draw_sphere_wires(centerPos C.Vector3, radius f32, rings int, slices int, color C.Color) {
	C.DrawSphereWires(centerPos, radius, rings, slices, color)
}

fn C.DrawCylinder(position C.Vector3, radiusTop f32, radiusBottom f32, height f32, slices int, color C.Color)

[inline]
pub fn draw_cylinder(position C.Vector3, radiusTop f32, radiusBottom f32, height f32, slices int, color C.Color) {
	C.DrawCylinder(position, radiusTop, radiusBottom, height, slices, color)
}

fn C.DrawCylinderWires(position C.Vector3, radiusTop f32, radiusBottom f32, height f32, slices int, color C.Color)

[inline]
pub fn draw_cylinder_wires(position C.Vector3, radiusTop f32, radiusBottom f32, height f32, slices int, color C.Color) {
	C.DrawCylinderWires(position, radiusTop, radiusBottom, height, slices, color)
}

fn C.DrawPlane(centerPos C.Vector3, size C.Vector2, color C.Color)

[inline]
pub fn draw_plane(centerPos C.Vector3, size C.Vector2, color C.Color) {
	C.DrawPlane(centerPos, size, color)
}

fn C.DrawRay(ray C.Ray, color C.Color)

[inline]
pub fn draw_ray(ray C.Ray, color C.Color) {
	C.DrawRay(ray, color)
}

fn C.DrawGrid(slices int, spacing f32)

[inline]
pub fn draw_grid(slices int, spacing f32) {
	C.DrawGrid(slices, spacing)
}

fn C.LoadModel(fileName &char) C.Model

[inline]
pub fn load_model(fileName string) C.Model {
	return C.LoadModel(fileName.str)
}

fn C.LoadModelFromMesh(mesh C.Mesh) C.Model

[inline]
pub fn load_model_from_mesh(mesh C.Mesh) C.Model {
	return C.LoadModelFromMesh(mesh)
}

fn C.UnloadModel(model C.Model)

[inline]
pub fn unload_model(model C.Model) {
	C.UnloadModel(model)
}

fn C.UnloadModelKeepMeshes(model C.Model)

[inline]
pub fn unload_model_keep_meshes(model C.Model) {
	C.UnloadModelKeepMeshes(model)
}

fn C.UploadMesh(mesh &C.Mesh, dynamic bool)

[inline]
pub fn upload_mesh(mesh &C.Mesh, dynamic bool) {
	C.UploadMesh(mesh, dynamic)
}

fn C.UpdateMeshBuffer(mesh C.Mesh, index int, data voidptr, dataSize int, offset int)

[inline]
pub fn update_mesh_buffer(mesh C.Mesh, index int, data voidptr, dataSize int, offset int) {
	C.UpdateMeshBuffer(mesh, index, data, dataSize, offset)
}

fn C.DrawMesh(mesh C.Mesh, material C.Material, transform C.Matrix)

[inline]
pub fn draw_mesh(mesh C.Mesh, material C.Material, transform C.Matrix) {
	C.DrawMesh(mesh, material, transform)
}

fn C.DrawMeshInstanced(mesh C.Mesh, material C.Material, transforms &C.Matrix, instances int)

[inline]
pub fn draw_mesh_instanced(mesh C.Mesh, material C.Material, transforms &C.Matrix, instances int) {
	C.DrawMeshInstanced(mesh, material, transforms, instances)
}

fn C.UnloadMesh(mesh C.Mesh)

[inline]
pub fn unload_mesh(mesh C.Mesh) {
	C.UnloadMesh(mesh)
}

fn C.ExportMesh(mesh C.Mesh, fileName &char) bool

[inline]
pub fn export_mesh(mesh C.Mesh, fileName string) bool {
	return C.ExportMesh(mesh, fileName.str)
}

fn C.LoadMaterials(fileName &char, materialCount &int) &C.Material

[inline]
pub fn load_materials(fileName string, materialCount &int) &C.Material {
	return C.LoadMaterials(fileName.str, materialCount)
}

fn C.LoadMaterialDefault() C.Material

[inline]
pub fn load_material_default() C.Material {
	return C.LoadMaterialDefault()
}

fn C.UnloadMaterial(material C.Material)

[inline]
pub fn unload_material(material C.Material) {
	C.UnloadMaterial(material)
}

fn C.SetMaterialTexture(material &C.Material, mapType int, texture C.Texture2D)

[inline]
pub fn set_material_texture(material &C.Material, mapType int, texture C.Texture2D) {
	C.SetMaterialTexture(material, mapType, texture)
}

fn C.SetModelMeshMaterial(model &C.Model, meshId int, materialId int)

[inline]
pub fn set_model_mesh_material(model &C.Model, meshId int, materialId int) {
	C.SetModelMeshMaterial(model, meshId, materialId)
}

fn C.LoadModelAnimations(fileName &char, animsCount &int) &C.ModelAnimation

[inline]
pub fn load_model_animations(fileName string, animsCount &int) &C.ModelAnimation {
	return C.LoadModelAnimations(fileName.str, animsCount)
}

fn C.UpdateModelAnimation(model C.Model, anim C.ModelAnimation, frame int)

[inline]
pub fn update_model_animation(model C.Model, anim C.ModelAnimation, frame int) {
	C.UpdateModelAnimation(model, anim, frame)
}

fn C.UnloadModelAnimation(anim C.ModelAnimation)

[inline]
pub fn unload_model_animation(anim C.ModelAnimation) {
	C.UnloadModelAnimation(anim)
}

fn C.UnloadModelAnimations(animations &C.ModelAnimation, count u32)

[inline]
pub fn unload_model_animations(animations &C.ModelAnimation, count u32) {
	C.UnloadModelAnimations(animations, count)
}

fn C.IsModelAnimationValid(model C.Model, anim C.ModelAnimation) bool

[inline]
pub fn is_model_animation_valid(model C.Model, anim C.ModelAnimation) bool {
	return C.IsModelAnimationValid(model, anim)
}

fn C.GenMeshPoly(sides int, radius f32) C.Mesh

[inline]
pub fn gen_mesh_poly(sides int, radius f32) C.Mesh {
	return C.GenMeshPoly(sides, radius)
}

fn C.GenMeshPlane(width f32, length f32, resX int, resZ int) C.Mesh

[inline]
pub fn gen_mesh_plane(width f32, length f32, resX int, resZ int) C.Mesh {
	return C.GenMeshPlane(width, length, resX, resZ)
}

fn C.GenMeshCube(width f32, height f32, length f32) C.Mesh

[inline]
pub fn gen_mesh_cube(width f32, height f32, length f32) C.Mesh {
	return C.GenMeshCube(width, height, length)
}

fn C.GenMeshSphere(radius f32, rings int, slices int) C.Mesh

[inline]
pub fn gen_mesh_sphere(radius f32, rings int, slices int) C.Mesh {
	return C.GenMeshSphere(radius, rings, slices)
}

fn C.GenMeshHemiSphere(radius f32, rings int, slices int) C.Mesh

[inline]
pub fn gen_mesh_hemi_sphere(radius f32, rings int, slices int) C.Mesh {
	return C.GenMeshHemiSphere(radius, rings, slices)
}

fn C.GenMeshCylinder(radius f32, height f32, slices int) C.Mesh

[inline]
pub fn gen_mesh_cylinder(radius f32, height f32, slices int) C.Mesh {
	return C.GenMeshCylinder(radius, height, slices)
}

fn C.GenMeshTorus(radius f32, size f32, radSeg int, sides int) C.Mesh

[inline]
pub fn gen_mesh_torus(radius f32, size f32, radSeg int, sides int) C.Mesh {
	return C.GenMeshTorus(radius, size, radSeg, sides)
}

fn C.GenMeshKnot(radius f32, size f32, radSeg int, sides int) C.Mesh

[inline]
pub fn gen_mesh_knot(radius f32, size f32, radSeg int, sides int) C.Mesh {
	return C.GenMeshKnot(radius, size, radSeg, sides)
}

fn C.GenMeshHeightmap(heightmap C.Image, size C.Vector3) C.Mesh

[inline]
pub fn gen_mesh_heightmap(heightmap C.Image, size C.Vector3) C.Mesh {
	return C.GenMeshHeightmap(heightmap, size)
}

fn C.GenMeshCubicmap(cubicmap C.Image, cubeSize C.Vector3) C.Mesh

[inline]
pub fn gen_mesh_cubicmap(cubicmap C.Image, cubeSize C.Vector3) C.Mesh {
	return C.GenMeshCubicmap(cubicmap, cubeSize)
}

fn C.MeshBoundingBox(mesh C.Mesh) C.BoundingBox

[inline]
pub fn mesh_bounding_box(mesh C.Mesh) C.BoundingBox {
	return C.MeshBoundingBox(mesh)
}

fn C.MeshTangents(mesh &C.Mesh)

[inline]
pub fn mesh_tangents(mesh &C.Mesh) {
	C.MeshTangents(mesh)
}

fn C.MeshBinormals(mesh &C.Mesh)

[inline]
pub fn mesh_binormals(mesh &C.Mesh) {
	C.MeshBinormals(mesh)
}

fn C.DrawModel(model C.Model, position C.Vector3, scale f32, tint C.Color)

[inline]
pub fn draw_model(model C.Model, position C.Vector3, scale f32, tint C.Color) {
	C.DrawModel(model, position, scale, tint)
}

fn C.DrawModelEx(model C.Model, position C.Vector3, rotationAxis C.Vector3, rotationAngle f32, scale C.Vector3, tint C.Color)

[inline]
pub fn draw_model_ex(model C.Model, position C.Vector3, rotationAxis C.Vector3, rotationAngle f32, scale C.Vector3, tint C.Color) {
	C.DrawModelEx(model, position, rotationAxis, rotationAngle, scale, tint)
}

fn C.DrawModelWires(model C.Model, position C.Vector3, scale f32, tint C.Color)

[inline]
pub fn draw_model_wires(model C.Model, position C.Vector3, scale f32, tint C.Color) {
	C.DrawModelWires(model, position, scale, tint)
}

fn C.DrawModelWiresEx(model C.Model, position C.Vector3, rotationAxis C.Vector3, rotationAngle f32, scale C.Vector3, tint C.Color)

[inline]
pub fn draw_model_wires_ex(model C.Model, position C.Vector3, rotationAxis C.Vector3, rotationAngle f32, scale C.Vector3, tint C.Color) {
	C.DrawModelWiresEx(model, position, rotationAxis, rotationAngle, scale, tint)
}

fn C.DrawBoundingBox(box C.BoundingBox, color C.Color)

[inline]
pub fn draw_bounding_box(box C.BoundingBox, color C.Color) {
	C.DrawBoundingBox(box, color)
}

fn C.DrawBillboard(camera C.Camera, texture C.Texture2D, center C.Vector3, size f32, tint C.Color)

[inline]
pub fn draw_billboard(camera C.Camera, texture C.Texture2D, center C.Vector3, size f32, tint C.Color) {
	C.DrawBillboard(camera, texture, center, size, tint)
}

fn C.DrawBillboardRec(camera C.Camera, texture C.Texture2D, source C.Rectangle, center C.Vector3, size f32, tint C.Color)

[inline]
pub fn draw_billboard_rec(camera C.Camera, texture C.Texture2D, source C.Rectangle, center C.Vector3, size f32, tint C.Color) {
	C.DrawBillboardRec(camera, texture, source, center, size, tint)
}

fn C.CheckCollisionSpheres(center1 C.Vector3, radius1 f32, center2 C.Vector3, radius2 f32) bool

[inline]
pub fn check_collision_spheres(center1 C.Vector3, radius1 f32, center2 C.Vector3, radius2 f32) bool {
	return C.CheckCollisionSpheres(center1, radius1, center2, radius2)
}

fn C.CheckCollisionBoxes(box1 C.BoundingBox, box2 C.BoundingBox) bool

[inline]
pub fn check_collision_boxes(box1 C.BoundingBox, box2 C.BoundingBox) bool {
	return C.CheckCollisionBoxes(box1, box2)
}

fn C.CheckCollisionBoxSphere(box C.BoundingBox, center C.Vector3, radius f32) bool

[inline]
pub fn check_collision_box_sphere(box C.BoundingBox, center C.Vector3, radius f32) bool {
	return C.CheckCollisionBoxSphere(box, center, radius)
}

fn C.CheckCollisionRaySphere(ray C.Ray, center C.Vector3, radius f32) bool

[inline]
pub fn check_collision_ray_sphere(ray C.Ray, center C.Vector3, radius f32) bool {
	return C.CheckCollisionRaySphere(ray, center, radius)
}

fn C.CheckCollisionRaySphereEx(ray C.Ray, center C.Vector3, radius f32, collisionPoint &C.Vector3) bool

[inline]
pub fn check_collision_ray_sphere_ex(ray C.Ray, center C.Vector3, radius f32, collisionPoint &C.Vector3) bool {
	return C.CheckCollisionRaySphereEx(ray, center, radius, collisionPoint)
}

fn C.CheckCollisionRayBox(ray C.Ray, box C.BoundingBox) bool

[inline]
pub fn check_collision_ray_box(ray C.Ray, box C.BoundingBox) bool {
	return C.CheckCollisionRayBox(ray, box)
}

fn C.GetCollisionRayMesh(ray C.Ray, mesh C.Mesh, transform C.Matrix) C.RayHitInfo

[inline]
pub fn get_collision_ray_mesh(ray C.Ray, mesh C.Mesh, transform C.Matrix) C.RayHitInfo {
	return C.GetCollisionRayMesh(ray, mesh, transform)
}

fn C.GetCollisionRayModel(ray C.Ray, model C.Model) C.RayHitInfo

[inline]
pub fn get_collision_ray_model(ray C.Ray, model C.Model) C.RayHitInfo {
	return C.GetCollisionRayModel(ray, model)
}

fn C.GetCollisionRayTriangle(ray C.Ray, p1 C.Vector3, p2 C.Vector3, p3 C.Vector3) C.RayHitInfo

[inline]
pub fn get_collision_ray_triangle(ray C.Ray, p1 C.Vector3, p2 C.Vector3, p3 C.Vector3) C.RayHitInfo {
	return C.GetCollisionRayTriangle(ray, p1, p2, p3)
}

fn C.GetCollisionRayGround(ray C.Ray, groundHeight f32) C.RayHitInfo

[inline]
pub fn get_collision_ray_ground(ray C.Ray, groundHeight f32) C.RayHitInfo {
	return C.GetCollisionRayGround(ray, groundHeight)
}

fn C.InitAudioDevice()

[inline]
pub fn init_audio_device() {
	C.InitAudioDevice()
}

fn C.CloseAudioDevice()

[inline]
pub fn close_audio_device() {
	C.CloseAudioDevice()
}

fn C.IsAudioDeviceReady() bool

[inline]
pub fn is_audio_device_ready() bool {
	return C.IsAudioDeviceReady()
}

fn C.SetMasterVolume(volume f32)

[inline]
pub fn set_master_volume(volume f32) {
	C.SetMasterVolume(volume)
}

fn C.LoadWave(fileName &char) C.Wave

[inline]
pub fn load_wave(fileName string) C.Wave {
	return C.LoadWave(fileName.str)
}

fn C.LoadWaveFromMemory(fileType &char, fileData &char, dataSize int) C.Wave

[inline]
pub fn load_wave_from_memory(fileType string, fileData string, dataSize int) C.Wave {
	return C.LoadWaveFromMemory(fileType.str, fileData.str, dataSize)
}

fn C.LoadSound(fileName &char) C.Sound

[inline]
pub fn load_sound(fileName string) C.Sound {
	return C.LoadSound(fileName.str)
}

fn C.LoadSoundFromWave(wave C.Wave) C.Sound

[inline]
pub fn load_sound_from_wave(wave C.Wave) C.Sound {
	return C.LoadSoundFromWave(wave)
}

fn C.UpdateSound(sound C.Sound, data voidptr, samplesCount int)

[inline]
pub fn update_sound(sound C.Sound, data voidptr, samplesCount int) {
	C.UpdateSound(sound, data, samplesCount)
}

fn C.UnloadWave(wave C.Wave)

[inline]
pub fn unload_wave(wave C.Wave) {
	C.UnloadWave(wave)
}

fn C.UnloadSound(sound C.Sound)

[inline]
pub fn unload_sound(sound C.Sound) {
	C.UnloadSound(sound)
}

fn C.ExportWave(wave C.Wave, fileName &char) bool

[inline]
pub fn export_wave(wave C.Wave, fileName string) bool {
	return C.ExportWave(wave, fileName.str)
}

fn C.ExportWaveAsCode(wave C.Wave, fileName &char) bool

[inline]
pub fn export_wave_as_code(wave C.Wave, fileName string) bool {
	return C.ExportWaveAsCode(wave, fileName.str)
}

fn C.PlaySound(sound C.Sound)

[inline]
pub fn play_sound(sound C.Sound) {
	C.PlaySound(sound)
}

fn C.StopSound(sound C.Sound)

[inline]
pub fn stop_sound(sound C.Sound) {
	C.StopSound(sound)
}

fn C.PauseSound(sound C.Sound)

[inline]
pub fn pause_sound(sound C.Sound) {
	C.PauseSound(sound)
}

fn C.ResumeSound(sound C.Sound)

[inline]
pub fn resume_sound(sound C.Sound) {
	C.ResumeSound(sound)
}

fn C.PlaySoundMulti(sound C.Sound)

[inline]
pub fn play_sound_multi(sound C.Sound) {
	C.PlaySoundMulti(sound)
}

fn C.StopSoundMulti()

[inline]
pub fn stop_sound_multi() {
	C.StopSoundMulti()
}

fn C.GetSoundsPlaying() int

[inline]
pub fn get_sounds_playing() int {
	return C.GetSoundsPlaying()
}

fn C.IsSoundPlaying(sound C.Sound) bool

[inline]
pub fn is_sound_playing(sound C.Sound) bool {
	return C.IsSoundPlaying(sound)
}

fn C.SetSoundVolume(sound C.Sound, volume f32)

[inline]
pub fn set_sound_volume(sound C.Sound, volume f32) {
	C.SetSoundVolume(sound, volume)
}

fn C.SetSoundPitch(sound C.Sound, pitch f32)

[inline]
pub fn set_sound_pitch(sound C.Sound, pitch f32) {
	C.SetSoundPitch(sound, pitch)
}

fn C.WaveFormat(wave &C.Wave, sampleRate int, sampleSize int, channels int)

[inline]
pub fn wave_format(wave &C.Wave, sampleRate int, sampleSize int, channels int) {
	C.WaveFormat(wave, sampleRate, sampleSize, channels)
}

fn C.WaveCopy(wave C.Wave) C.Wave

[inline]
pub fn wave_copy(wave C.Wave) C.Wave {
	return C.WaveCopy(wave)
}

fn C.WaveCrop(wave &C.Wave, initSample int, finalSample int)

[inline]
pub fn wave_crop(wave &C.Wave, initSample int, finalSample int) {
	C.WaveCrop(wave, initSample, finalSample)
}

fn C.LoadWaveSamples(wave C.Wave) &f32

[inline]
pub fn load_wave_samples(wave C.Wave) &f32 {
	return C.LoadWaveSamples(wave)
}

fn C.UnloadWaveSamples(samples &f32)

[inline]
pub fn unload_wave_samples(samples &f32) {
	C.UnloadWaveSamples(samples)
}

fn C.LoadMusicStream(fileName &char) C.Music

[inline]
pub fn load_music_stream(fileName string) C.Music {
	return C.LoadMusicStream(fileName.str)
}

fn C.LoadMusicStreamFromMemory(fileType &char, data &char, dataSize int) C.Music

[inline]
pub fn load_music_stream_from_memory(fileType string, data string, dataSize int) C.Music {
	return C.LoadMusicStreamFromMemory(fileType.str, data.str, dataSize)
}

fn C.UnloadMusicStream(music C.Music)

[inline]
pub fn unload_music_stream(music C.Music) {
	C.UnloadMusicStream(music)
}

fn C.PlayMusicStream(music C.Music)

[inline]
pub fn play_music_stream(music C.Music) {
	C.PlayMusicStream(music)
}

fn C.IsMusicPlaying(music C.Music) bool

[inline]
pub fn is_music_playing(music C.Music) bool {
	return C.IsMusicPlaying(music)
}

fn C.UpdateMusicStream(music C.Music)

[inline]
pub fn update_music_stream(music C.Music) {
	C.UpdateMusicStream(music)
}

fn C.StopMusicStream(music C.Music)

[inline]
pub fn stop_music_stream(music C.Music) {
	C.StopMusicStream(music)
}

fn C.PauseMusicStream(music C.Music)

[inline]
pub fn pause_music_stream(music C.Music) {
	C.PauseMusicStream(music)
}

fn C.ResumeMusicStream(music C.Music)

[inline]
pub fn resume_music_stream(music C.Music) {
	C.ResumeMusicStream(music)
}

fn C.SetMusicVolume(music C.Music, volume f32)

[inline]
pub fn set_music_volume(music C.Music, volume f32) {
	C.SetMusicVolume(music, volume)
}

fn C.SetMusicPitch(music C.Music, pitch f32)

[inline]
pub fn set_music_pitch(music C.Music, pitch f32) {
	C.SetMusicPitch(music, pitch)
}

fn C.GetMusicTimeLength(music C.Music) f32

[inline]
pub fn get_music_time_length(music C.Music) f32 {
	return C.GetMusicTimeLength(music)
}

fn C.GetMusicTimePlayed(music C.Music) f32

[inline]
pub fn get_music_time_played(music C.Music) f32 {
	return C.GetMusicTimePlayed(music)
}

fn C.InitAudioStream(sampleRate u32, sampleSize u32, channels u32) C.AudioStream

[inline]
pub fn init_audio_stream(sampleRate u32, sampleSize u32, channels u32) C.AudioStream {
	return C.InitAudioStream(sampleRate, sampleSize, channels)
}

fn C.UpdateAudioStream(stream C.AudioStream, data voidptr, samplesCount int)

[inline]
pub fn update_audio_stream(stream C.AudioStream, data voidptr, samplesCount int) {
	C.UpdateAudioStream(stream, data, samplesCount)
}

fn C.CloseAudioStream(stream C.AudioStream)

[inline]
pub fn close_audio_stream(stream C.AudioStream) {
	C.CloseAudioStream(stream)
}

fn C.IsAudioStreamProcessed(stream C.AudioStream) bool

[inline]
pub fn is_audio_stream_processed(stream C.AudioStream) bool {
	return C.IsAudioStreamProcessed(stream)
}

fn C.PlayAudioStream(stream C.AudioStream)

[inline]
pub fn play_audio_stream(stream C.AudioStream) {
	C.PlayAudioStream(stream)
}

fn C.PauseAudioStream(stream C.AudioStream)

[inline]
pub fn pause_audio_stream(stream C.AudioStream) {
	C.PauseAudioStream(stream)
}

fn C.ResumeAudioStream(stream C.AudioStream)

[inline]
pub fn resume_audio_stream(stream C.AudioStream) {
	C.ResumeAudioStream(stream)
}

fn C.IsAudioStreamPlaying(stream C.AudioStream) bool

[inline]
pub fn is_audio_stream_playing(stream C.AudioStream) bool {
	return C.IsAudioStreamPlaying(stream)
}

fn C.StopAudioStream(stream C.AudioStream)

[inline]
pub fn stop_audio_stream(stream C.AudioStream) {
	C.StopAudioStream(stream)
}

fn C.SetAudioStreamVolume(stream C.AudioStream, volume f32)

[inline]
pub fn set_audio_stream_volume(stream C.AudioStream, volume f32) {
	C.SetAudioStreamVolume(stream, volume)
}

fn C.SetAudioStreamPitch(stream C.AudioStream, pitch f32)

[inline]
pub fn set_audio_stream_pitch(stream C.AudioStream, pitch f32) {
	C.SetAudioStreamPitch(stream, pitch)
}

fn C.SetAudioStreamBufferSizeDefault(size int)

[inline]
pub fn set_audio_stream_buffer_size_default(size int) {
	C.SetAudioStreamBufferSizeDefault(size)
}

fn C.GuiEnable()

[inline]
pub fn gui_enable() {
	C.GuiEnable()
}

fn C.GuiDisable()

[inline]
pub fn gui_disable() {
	C.GuiDisable()
}

fn C.GuiLock()

[inline]
pub fn gui_lock() {
	C.GuiLock()
}

fn C.GuiUnlock()

[inline]
pub fn gui_unlock() {
	C.GuiUnlock()
}

fn C.GuiFade(alpha f32)

[inline]
pub fn gui_fade(alpha f32) {
	C.GuiFade(alpha)
}

fn C.GuiSetState(state int)

[inline]
pub fn gui_set_state(state int) {
	C.GuiSetState(state)
}

fn C.GuiGetState() int

[inline]
pub fn gui_get_state() int {
	return C.GuiGetState()
}

fn C.GuiSetFont(font C.Font)

[inline]
pub fn gui_set_font(font C.Font) {
	C.GuiSetFont(font)
}

fn C.GuiGetFont() C.Font

[inline]
pub fn gui_get_font() C.Font {
	return C.GuiGetFont()
}

fn C.GuiSetStyle(control int, property int, value int)

[inline]
pub fn gui_set_style(control int, property int, value int) {
	C.GuiSetStyle(control, property, value)
}

fn C.GuiGetStyle(control int, property int) int

[inline]
pub fn gui_get_style(control int, property int) int {
	return C.GuiGetStyle(control, property)
}

fn C.GuiTextBoxSetActive(bounds C.Rectangle)

[inline]
pub fn gui_text_box_set_active(bounds C.Rectangle) {
	C.GuiTextBoxSetActive(bounds)
}

fn C.GuiTextBoxGetActive() C.Rectangle

[inline]
pub fn gui_text_box_get_active() C.Rectangle {
	return C.GuiTextBoxGetActive()
}

fn C.GuiTextBoxSetCursor(cursor int)

[inline]
pub fn gui_text_box_set_cursor(cursor int) {
	C.GuiTextBoxSetCursor(cursor)
}

fn C.GuiTextBoxGetCursor() int

[inline]
pub fn gui_text_box_get_cursor() int {
	return C.GuiTextBoxGetCursor()
}

fn C.GuiTextBoxSetSelection(start int, length int)

[inline]
pub fn gui_text_box_set_selection(start int, length int) {
	C.GuiTextBoxSetSelection(start, length)
}

fn C.GuiTextBoxGetSelection() C.Vector2

[inline]
pub fn gui_text_box_get_selection() C.Vector2 {
	return C.GuiTextBoxGetSelection()
}

fn C.GuiTextBoxIsActive(bounds C.Rectangle) bool

[inline]
pub fn gui_text_box_is_active(bounds C.Rectangle) bool {
	return C.GuiTextBoxIsActive(bounds)
}

fn C.GuiTextBoxSelectAll(text &char)

[inline]
pub fn gui_text_box_select_all(text string) {
	C.GuiTextBoxSelectAll(text.str)
}

fn C.GuiTextBoxCopy(text &char)

[inline]
pub fn gui_text_box_copy(text string) {
	C.GuiTextBoxCopy(text.str)
}

fn C.GuiTextBoxPaste(text &char, textSize int)

[inline]
pub fn gui_text_box_paste(text string, textSize int) {
	C.GuiTextBoxPaste(text.str, textSize)
}

fn C.GuiTextBoxCut(text &char)

[inline]
pub fn gui_text_box_cut(text string) {
	C.GuiTextBoxCut(text.str)
}

fn C.GuiTextBoxDelete(text &char, length int, before bool) int

[inline]
pub fn gui_text_box_delete(text string, length int, before bool) int {
	return C.GuiTextBoxDelete(text.str, length, before)
}

fn C.GuiTextBoxGetByteIndex(text &char, start int, from int, to int) int

[inline]
pub fn gui_text_box_get_byte_index(text string, start int, from int, to int) int {
	return C.GuiTextBoxGetByteIndex(text.str, start, from, to)
}

fn C.GuiWindowBox(bounds C.Rectangle, title &char) bool

[inline]
pub fn gui_window_box(bounds C.Rectangle, title string) bool {
	return C.GuiWindowBox(bounds, title.str)
}

fn C.GuiGroupBox(bounds C.Rectangle, text &char)

[inline]
pub fn gui_group_box(bounds C.Rectangle, text string) {
	C.GuiGroupBox(bounds, text.str)
}

fn C.GuiLine(bounds C.Rectangle, text &char)

[inline]
pub fn gui_line(bounds C.Rectangle, text string) {
	C.GuiLine(bounds, text.str)
}

fn C.GuiPanel(bounds C.Rectangle)

[inline]
pub fn gui_panel(bounds C.Rectangle) {
	C.GuiPanel(bounds)
}

fn C.GuiScrollPanel(bounds C.Rectangle, content C.Rectangle, scroll &C.Vector2) C.Rectangle

[inline]
pub fn gui_scroll_panel(bounds C.Rectangle, content C.Rectangle, scroll &C.Vector2) C.Rectangle {
	return C.GuiScrollPanel(bounds, content, scroll)
}

fn C.GuiLabel(bounds C.Rectangle, text &char)

[inline]
pub fn gui_label(bounds C.Rectangle, text string) {
	C.GuiLabel(bounds, text.str)
}

fn C.GuiButton(bounds C.Rectangle, text &char) bool

[inline]
pub fn gui_button(bounds C.Rectangle, text string) bool {
	return C.GuiButton(bounds, text.str)
}

fn C.GuiLabelButton(bounds C.Rectangle, text &char) bool

[inline]
pub fn gui_label_button(bounds C.Rectangle, text string) bool {
	return C.GuiLabelButton(bounds, text.str)
}

fn C.GuiImageButton(bounds C.Rectangle, text &char, texture C.Texture2D) bool

[inline]
pub fn gui_image_button(bounds C.Rectangle, text string, texture C.Texture2D) bool {
	return C.GuiImageButton(bounds, text.str, texture)
}

fn C.GuiImageButtonEx(bounds C.Rectangle, text &char, texture C.Texture2D, texSource C.Rectangle) bool

[inline]
pub fn gui_image_button_ex(bounds C.Rectangle, text string, texture C.Texture2D, texSource C.Rectangle) bool {
	return C.GuiImageButtonEx(bounds, text.str, texture, texSource)
}

fn C.GuiToggle(bounds C.Rectangle, text &char, active bool) bool

[inline]
pub fn gui_toggle(bounds C.Rectangle, text string, active bool) bool {
	return C.GuiToggle(bounds, text.str, active)
}

fn C.GuiToggleGroup(bounds C.Rectangle, text &char, active int) int

[inline]
pub fn gui_toggle_group(bounds C.Rectangle, text string, active int) int {
	return C.GuiToggleGroup(bounds, text.str, active)
}

fn C.GuiCheckBox(bounds C.Rectangle, text &char, checked bool) bool

[inline]
pub fn gui_check_box(bounds C.Rectangle, text string, checked bool) bool {
	return C.GuiCheckBox(bounds, text.str, checked)
}

fn C.GuiComboBox(bounds C.Rectangle, text &char, active int) int

[inline]
pub fn gui_combo_box(bounds C.Rectangle, text string, active int) int {
	return C.GuiComboBox(bounds, text.str, active)
}

fn C.GuiDropdownBox(bounds C.Rectangle, text &char, active &int, editMode bool) bool

[inline]
pub fn gui_dropdown_box(bounds C.Rectangle, text string, active &int, editMode bool) bool {
	return C.GuiDropdownBox(bounds, text.str, active, editMode)
}

fn C.GuiTextBox(bounds C.Rectangle, text &char, textSize int, editMode bool) bool

[inline]
pub fn gui_text_box(bounds C.Rectangle, text string, textSize int, editMode bool) bool {
	return C.GuiTextBox(bounds, text.str, textSize, editMode)
}

fn C.GuiTextBoxMulti(bounds C.Rectangle, text &char, textSize int, editMode bool) bool

[inline]
pub fn gui_text_box_multi(bounds C.Rectangle, text string, textSize int, editMode bool) bool {
	return C.GuiTextBoxMulti(bounds, text.str, textSize, editMode)
}

fn C.GuiSlider(bounds C.Rectangle, textLeft &char, textRight &char, value f32, minValue f32, maxValue f32) f32

[inline]
pub fn gui_slider(bounds C.Rectangle, textLeft string, textRight string, value f32, minValue f32, maxValue f32) f32 {
	return C.GuiSlider(bounds, textLeft.str, textRight.str, value, minValue, maxValue)
}

fn C.GuiSliderBar(bounds C.Rectangle, textLeft &char, textRight &char, value f32, minValue f32, maxValue f32) f32

[inline]
pub fn gui_slider_bar(bounds C.Rectangle, textLeft string, textRight string, value f32, minValue f32, maxValue f32) f32 {
	return C.GuiSliderBar(bounds, textLeft.str, textRight.str, value, minValue, maxValue)
}

fn C.GuiProgressBar(bounds C.Rectangle, textLeft &char, textRight &char, value f32, minValue f32, maxValue f32) f32

[inline]
pub fn gui_progress_bar(bounds C.Rectangle, textLeft string, textRight string, value f32, minValue f32, maxValue f32) f32 {
	return C.GuiProgressBar(bounds, textLeft.str, textRight.str, value, minValue, maxValue)
}

fn C.GuiStatusBar(bounds C.Rectangle, text &char)

[inline]
pub fn gui_status_bar(bounds C.Rectangle, text string) {
	C.GuiStatusBar(bounds, text.str)
}

fn C.GuiDummyRec(bounds C.Rectangle, text &char)

[inline]
pub fn gui_dummy_rec(bounds C.Rectangle, text string) {
	C.GuiDummyRec(bounds, text.str)
}

fn C.GuiScrollBar(bounds C.Rectangle, value int, minValue int, maxValue int) int

[inline]
pub fn gui_scroll_bar(bounds C.Rectangle, value int, minValue int, maxValue int) int {
	return C.GuiScrollBar(bounds, value, minValue, maxValue)
}

fn C.GuiGrid(bounds C.Rectangle, spacing f32, subdivs int) C.Vector2

[inline]
pub fn gui_grid(bounds C.Rectangle, spacing f32, subdivs int) C.Vector2 {
	return C.GuiGrid(bounds, spacing, subdivs)
}

fn C.GuiListView(bounds C.Rectangle, text &char, scrollIndex &int, active int) int

[inline]
pub fn gui_list_view(bounds C.Rectangle, text string, scrollIndex &int, active int) int {
	return C.GuiListView(bounds, text.str, scrollIndex, active)
}

fn C.GuiListViewEx(bounds C.Rectangle, text &&char, count int, focus &int, scrollIndex &int, active int) int

[inline]
pub fn gui_list_view_ex(bounds C.Rectangle, text &&char, count int, focus &int, scrollIndex &int, active int) int {
	return C.GuiListViewEx(bounds, text, count, focus, scrollIndex, active)
}

fn C.GuiMessageBox(bounds C.Rectangle, title &char, message &char, buttons &char) int

[inline]
pub fn gui_message_box(bounds C.Rectangle, title string, message string, buttons string) int {
	return C.GuiMessageBox(bounds, title.str, message.str, buttons.str)
}

fn C.GuiTextInputBox(bounds C.Rectangle, title &char, message &char, buttons &char, text &char) int

[inline]
pub fn gui_text_input_box(bounds C.Rectangle, title string, message string, buttons string, text string) int {
	return C.GuiTextInputBox(bounds, title.str, message.str, buttons.str, text.str)
}

fn C.GuiColorPicker(bounds C.Rectangle, color C.Color) C.Color

[inline]
pub fn gui_color_picker(bounds C.Rectangle, color C.Color) C.Color {
	return C.GuiColorPicker(bounds, color)
}

fn C.GuiLoadStyle(fileName &char)

[inline]
pub fn gui_load_style(fileName string) {
	C.GuiLoadStyle(fileName.str)
}

fn C.GuiLoadStyleProps(props &int, count int)

[inline]
pub fn gui_load_style_props(props &int, count int) {
	C.GuiLoadStyleProps(props, count)
}

fn C.GuiLoadStyleDefault()

[inline]
pub fn gui_load_style_default() {
	C.GuiLoadStyleDefault()
}

fn C.GuiUpdateStyleComplete()

[inline]
pub fn gui_update_style_complete() {
	C.GuiUpdateStyleComplete()
}

fn C.GuiIconText(iconId int, text &char) &char

[inline]
pub fn gui_icon_text(iconId int, text string) string {
	return unsafe { C.GuiIconText(iconId, text.str).vstring() }
}
