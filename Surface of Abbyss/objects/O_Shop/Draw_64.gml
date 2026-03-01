

if (!shopOpen) exit;


draw_set_alpha(1);
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);


draw_set_color(c_black);
draw_set_alpha(0.8);
    draw_rectangle(0, 0, guiWidth, guiHeight, 0);
draw_set_alpha(0.5);
    draw_rectangle(menuMargin, 0, menuMargin + menuWidth, guiHeight, 0);
draw_set_alpha(1);
draw_set_color(c_white);

for (var i=0; i < itemCount; i++) {
    var arr = items[| i];
    var item_name = arr[0];
    
    var _x_list = menuMargin + menuWidth/2;
    var _y_list = (guiHeight/2) + (i - selectedAnim) * 32;
    
    var s = 1;
    var display_text = item_name;
    
    if (i == selected) {
        s = 1.4;
        display_text = "> " + item_name + " <";
    }
    
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
        draw_text_transformed(_x_list, _y_list, display_text, s, s, 0);
    draw_set_valign(fa_top);
    draw_set_halign(fa_left);
}

var arr_sel = items[| selected];
var item_sel = arr_sel[0];
var price_sel = arr_sel[1];
var desc_sel = arr_sel[2];

var _x_pre = (menuMargin + menuWidth) + previewWidth/2;
var _y_pre = (guiHeight/2);

// Mencari Sprite (Pastikan nama di Asset Browser adalah sItem_NamaItem)
var spr = asset_get_index("sItem_" + item_sel);

if (sprite_exists(spr)) {
    draw_sprite_ext(spr, 0, _x_pre, _y_pre - 24, 2, 2, 0, c_white, 1);
}

// Deskripsi
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
    draw_text(_x_pre, _y_pre + 80, desc_sel);
draw_set_valign(fa_top);
    draw_set_halign(fa_left);

draw_set_color(c_white);
draw_text(8, 8, "Money: " + string(global.money));

draw_set_valign(fa_bottom);
    draw_text(menuMargin + menuWidth + 4, guiHeight - 4, "Price: " + string(price_sel));
    
    draw_set_halign(fa_right);
        draw_text(guiWidth - 4, guiHeight - 4, "Press ENTER to buy");
    draw_set_halign(fa_left);
draw_set_valign(fa_top);