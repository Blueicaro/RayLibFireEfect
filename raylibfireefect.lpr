program RayLibFireEfect;

{$mode objfpc}{$H+}

uses
  cmem,
  raylib;

type
  Tscreen_buffer_data = array [0..120000] of PColor;

const
  screenWidth = 400;
  screenHeight = 400;

var
  ColorPixel: TColor;
  screen_buffer_data: Tscreen_buffer_data;
  screen_buffer: TImage;
  screen_buffer_texture: TTexture2D;

begin

  with screen_buffer do
  begin
    Data := @screen_buffer_data;
    Height := 400;
    Width := 300;
    format := PIXELFORMAT_UNCOMPRESSED_R8G8B8A8;
    mipmaps := 1;
  end;
  // Initialization
  InitWindow(screenWidth, screenHeight, 'Hello world!');
  // SetTargetFPS(60);// Set our game to run at 60 frames-per-second
  screen_buffer_texture := LoadTextureFromImage(screen_buffer);
  with ColorPixel do
  begin
    r := 255;
    g := 0;
    b := 0;
    a := 255;
  end;

  // Main game loop

  while not WindowShouldClose() do
  begin
    // Draw
    BeginDrawing();
    ClearBackground(RAYWHITE);
    DrawPixel(200, 200, ColorPixel);
    EndDrawing();
  end;

  // De-Initialization
  CloseWindow();        // Close window and OpenGL context
end.
