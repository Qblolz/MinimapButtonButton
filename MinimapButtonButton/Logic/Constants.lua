local _, addon = ...;

addon.export('Logic/Constants', {
  anchors = {
    CENTER = 'CENTER',
    LEFT = 'LEFT',
    RIGHT = 'RIGHT',
    TOP = 'TOP',
    BOTTOM = 'BOTTOM',
    TOPLEFT = 'TOPLEFT',
    TOPRIGHT = 'TOPRIGHT',
    BOTTOMLEFT = 'BOTTOMLEFT',
    BOTTOMRIGHT = 'BOTTOMRIGHT',
  },
  FRAME_STRATA = 'MEDIUM',
  FRAME_LEVEL = 7,
  EDGE_SIZE = 16,
  MAINBUTTON_DEFAULT_SIZE = 44,
  MAINBUTTON_MIN_SIZE = 32,
  MAINBUTTON_MAX_SIZE = 52,
  LOGO_SIZE = 16,
  BUTTON_SPACING = 0,
  BUTTON_OFFSET_X = 0,
  BUTTON_OFFSET_Y = -1,
});
