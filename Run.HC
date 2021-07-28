CDoc *tmpdoc = DocNew;
CDoc *origdoc = Fs->put_doc;
Fs->put_doc = tmpdoc;

Bool begin = TRUE;

#include "lib/uPNG";
//#include "lib/HDAudio";

#define FRAME_COUNT 96

I64 load_i, play_i;
I64 vid_w, vid_h;
CDC **vid_frames = MAlloc(sizeof(U64)*FRAME_COUNT);

U0 LoadVideoFrames()
{
    vid_w = 0;
    vid_h = 0;
    U8 filename[64];
    for (load_i=1;load_i<FRAME_COUNT+1;load_i++)
    {
        StrPrint(&filename, "C:/Home/BadApple/video/%06d.PNG", load_i);
        vid_frames[load_i] = PNGRead(&filename);
        if (!vid_w) vid_w = vid_frames[load_i]->width;
        if (!vid_h) vid_h = vid_frames[load_i]->height;
    }
}

U0 CopyRect(CDC *dc,I64 x,I64 y,CDC *rect)
{//Copy rect with clipping.
  U8 *dc_pos=dc->body;
  U8 *rect_pos=rect->body;
  I64 rect_row=0;
  I64 rect_y_ofs=0;
  I64 rect_x_ofs=0;
  U8 *rect_line;

  //Handle horizontal clipping left
  while (x<0) { rect_x_ofs++; x++; }

  //Handle vertical clipping top
  while (y<0)
  {
    rect_pos+=rect->width_internal;
    rect_y_ofs++; y++;
  }

  // default, clip line to copy as width-left off screen
  rect_line=rect->width-rect_x_ofs;

  if (-rect_x_ofs+x+rect->width>=dc->width)
  {
    rect_line-=((-rect_x_ofs+x+rect->width)-dc->width);
  }

  rect_pos+=rect_x_ofs;
  while (rect_row<(rect->height-rect_y_ofs))
  {
    MemCpy(dc_pos+(y*dc->width_internal)+x,rect_pos,rect_line);
    dc_pos+=dc->width_internal;
    rect_pos+=rect->width_internal;
    rect_row++;
  }
}

U0 PlayVideo(CDC *dc)
{
    if (!begin) return;
    if (play_i>FRAME_COUNT) { Fs->draw_it = NULL; return; }
    CopyRect(gr.dc, (GR_WIDTH/2)-(vid_w/2),
        (GR_HEIGHT/2)-(vid_h/2), vid_frames[play_i++]);
}

load_i = 0;
play_i = 1;

Fs->put_doc = origdoc;
DocDel(tmpdoc);

//EAudioStream *audio_stream = CAlloc(sizeof(EAudioStream));
//audio_stream->rate = 48000;
//audio_stream->bits = 16;
//audio_stream->channels = 2;
//audio_stream->buf = FileRead("audio/bad_apple.pcm", &audio_stream->size);

Spawn(&LoadVideoFrames,,,mp_cnt-1);
while (load_i<30) { Sleep(1); };

//EWMSetAudioStream(audio_stream);

Fs->draw_it = &PlayVideo;
while (play_i<FRAME_COUNT) { Sleep(1); };
Fs->draw_it = NULL;
DCFill(gr.dc);
