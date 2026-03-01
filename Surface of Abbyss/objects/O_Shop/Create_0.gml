
shopOpen = false;
global.shop = false;

selected = 0;
selectedAnim = 0;

items = ds_list_create();

ds_list_add(items, ["IronSword", 100, "Beginner Sword"]);
ds_list_add(items, ["GoldenSword", 200, "Advance Sword"]);
ds_list_add(items, ["AmethystSword", 500, "Well refined Sword"]);

itemCount = ds_list_size(items);

guiWidth = display_get_gui_width();
guiHeight = display_get_gui_height();

menuWidth = guiWidth * 0.3;
menuMargin = guiWidth * 0.1;

previewWidth = (guiWidth - (menuWidth + menuMargin));