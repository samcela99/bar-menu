
create table if not exists public.menu_items (
  id int primary key,
  c text not null check (c in ('cocktail','wine','beer','soft','primi','secondi','contorni','panini')),
  i text not null default '🍽' check (char_length(i) <= 8),
  p numeric(7,2) not null check (p >= 0 and p < 1000),
  a text[] not null default '{}',
  t text[] not null default '{}',
  n jsonb not null,
  d jsonb not null default '{}'::jsonb,
  available boolean not null default true,
  sort int not null default 0,
  updated_at timestamptz not null default now()
);
alter table public.menu_items enable row level security;
revoke all on public.menu_items from anon, authenticated;

insert into public.menu_items (id,c,i,p,a,t,n,d,available,sort) values
(0,'cocktail','🍹',8,'{}'::text[],array['pop']::text[],'{"it": "Mojito", "en": "Mojito", "es": "Mojito", "de": "Mojito"}'::jsonb,'{"it": "Rum, lime, menta e soda", "en": "Rum, lime, mint and soda", "es": "Ron, lima, hierbabuena y soda", "de": "Rum, Limette, Minze und Soda"}'::jsonb,true,0),
(1,'cocktail','🍍',8,'{}'::text[],'{}'::text[],'{"it": "Piña colada", "en": "Piña colada", "es": "Piña colada", "de": "Piña colada"}'::jsonb,'{"it": "Rum, ananas e cocco", "en": "Rum, pineapple and coconut", "es": "Ron, piña y coco", "de": "Rum, Ananas und Kokos"}'::jsonb,true,10),
(2,'cocktail','🥃',8,array['su']::text[],'{}'::text[],'{"it": "Negroni", "en": "Negroni", "es": "Negroni", "de": "Negroni"}'::jsonb,'{"it": "Gin, Campari e vermouth rosso", "en": "Gin, Campari and red vermouth", "es": "Ginebra, Campari y vermut rojo", "de": "Gin, Campari und roter Wermut"}'::jsonb,true,20),
(3,'cocktail','🍸',8,'{}'::text[],'{}'::text[],'{"it": "Long Island", "en": "Long Island", "es": "Long Island", "de": "Long Island"}'::jsonb,'{"it": "Vodka, rum, gin, tequila, triple sec e cola", "en": "Vodka, rum, gin, tequila, triple sec and cola", "es": "Vodka, ron, ginebra, tequila, triple sec y cola", "de": "Wodka, Rum, Gin, Tequila, Triple Sec und Cola"}'::jsonb,true,30),
(4,'cocktail','🥃',8,'{}'::text[],'{}'::text[],'{"it": "4 Bianchi", "en": "4 Bianchi", "es": "4 Bianchi", "de": "4 Bianchi"}'::jsonb,'{"it": "Quattro distillati bianchi", "en": "Four white spirits", "es": "Cuatro destilados blancos", "de": "Vier klare Spirituosen"}'::jsonb,true,40),
(5,'cocktail','🍑',8,'{}'::text[],'{}'::text[],'{"it": "Sex on the beach", "en": "Sex on the beach", "es": "Sex on the beach", "de": "Sex on the beach"}'::jsonb,'{"it": "Vodka, pesca, arancia e mirtillo", "en": "Vodka, peach, orange and cranberry", "es": "Vodka, melocotón, naranja y arándano", "de": "Wodka, Pfirsich, Orange und Cranberry"}'::jsonb,true,50),
(6,'cocktail','🍋',8,'{}'::text[],'{}'::text[],'{"it": "Gin tonic", "en": "Gin & tonic", "es": "Gin tonic", "de": "Gin Tonic"}'::jsonb,'{"it": "Gin e acqua tonica", "en": "Gin and tonic water", "es": "Ginebra y tónica", "de": "Gin und Tonic Water"}'::jsonb,true,60),
(7,'cocktail','🍊',8,array['su']::text[],array['pop']::text[],'{"it": "Aperol spritz", "en": "Aperol spritz", "es": "Aperol spritz", "de": "Aperol Spritz"}'::jsonb,'{"it": "Aperol, prosecco e soda", "en": "Aperol, prosecco and soda", "es": "Aperol, prosecco y soda", "de": "Aperol, Prosecco und Soda"}'::jsonb,true,70),
(8,'cocktail','🍹',8,array['su']::text[],'{}'::text[],'{"it": "Campari spritz", "en": "Campari spritz", "es": "Campari spritz", "de": "Campari Spritz"}'::jsonb,'{"it": "Campari, prosecco e soda", "en": "Campari, prosecco and soda", "es": "Campari, prosecco y soda", "de": "Campari, Prosecco und Soda"}'::jsonb,true,80),
(9,'cocktail','🥃',8,'{}'::text[],'{}'::text[],'{"it": "Campari e gin", "en": "Campari & gin", "es": "Campari y ginebra", "de": "Campari & Gin"}'::jsonb,'{"it": "", "en": "", "es": "", "de": ""}'::jsonb,true,90),
(10,'wine','🍷',4,array['su']::text[],'{}'::text[],'{"it": "Calice di vino rosso", "en": "Glass of red wine", "es": "Copa de vino tinto", "de": "Glas Rotwein"}'::jsonb,'{"it": "", "en": "", "es": "", "de": ""}'::jsonb,true,100),
(11,'wine','🥂',4,array['su']::text[],'{}'::text[],'{"it": "Calice di vino bianco", "en": "Glass of white wine", "es": "Copa de vino blanco", "de": "Glas Weißwein"}'::jsonb,'{"it": "", "en": "", "es": "", "de": ""}'::jsonb,true,110),
(12,'wine','🌸',4,array['su']::text[],'{}'::text[],'{"it": "Calice di vino rosé", "en": "Glass of rosé", "es": "Copa de vino rosado", "de": "Glas Rosé"}'::jsonb,'{"it": "", "en": "", "es": "", "de": ""}'::jsonb,true,120),
(13,'wine','🍾',4,array['su']::text[],'{}'::text[],'{"it": "Calice di prosecco", "en": "Glass of prosecco", "es": "Copa de prosecco", "de": "Glas Prosecco"}'::jsonb,'{"it": "", "en": "", "es": "", "de": ""}'::jsonb,true,130),
(14,'beer','🍺',3,array['gl']::text[],'{}'::text[],'{"it": "Heineken", "en": "Heineken", "es": "Heineken", "de": "Heineken"}'::jsonb,'{"it": "", "en": "", "es": "", "de": ""}'::jsonb,true,140),
(15,'beer','🍺',3,array['gl']::text[],'{}'::text[],'{"it": "Corona", "en": "Corona", "es": "Corona", "de": "Corona"}'::jsonb,'{"it": "", "en": "", "es": "", "de": ""}'::jsonb,true,150),
(16,'beer','🍺',3,array['gl']::text[],'{}'::text[],'{"it": "Desperados", "en": "Desperados", "es": "Desperados", "de": "Desperados"}'::jsonb,'{"it": "", "en": "", "es": "", "de": ""}'::jsonb,true,160),
(17,'beer','🍺',3,array['gl']::text[],'{}'::text[],'{"it": "Peroni", "en": "Peroni", "es": "Peroni", "de": "Peroni"}'::jsonb,'{"it": "", "en": "", "es": "", "de": ""}'::jsonb,true,170),
(18,'soft','🥤',2,'{}'::text[],'{}'::text[],'{"it": "Coca-Cola", "en": "Coca-Cola", "es": "Coca-Cola", "de": "Coca-Cola"}'::jsonb,'{"it": "Lattina", "en": "Can", "es": "Lata", "de": "Dose"}'::jsonb,true,180),
(19,'soft','🥤',2,'{}'::text[],'{}'::text[],'{"it": "Coca-Cola Zero", "en": "Coca-Cola Zero", "es": "Coca-Cola Zero", "de": "Coca-Cola Zero"}'::jsonb,'{"it": "Lattina", "en": "Can", "es": "Lata", "de": "Dose"}'::jsonb,true,190),
(20,'soft','🍊',2,'{}'::text[],'{}'::text[],'{"it": "Fanta arancia", "en": "Fanta orange", "es": "Fanta naranja", "de": "Fanta Orange"}'::jsonb,'{"it": "Lattina", "en": "Can", "es": "Lata", "de": "Dose"}'::jsonb,true,200),
(21,'soft','🍋',2,'{}'::text[],'{}'::text[],'{"it": "Fanta limone", "en": "Fanta lemon", "es": "Fanta limón", "de": "Fanta Zitrone"}'::jsonb,'{"it": "Lattina", "en": "Can", "es": "Lata", "de": "Dose"}'::jsonb,true,210),
(22,'soft','🍊',2,'{}'::text[],'{}'::text[],'{"it": "Aquarius arancia", "en": "Aquarius orange", "es": "Aquarius naranja", "de": "Aquarius Orange"}'::jsonb,'{"it": "Lattina", "en": "Can", "es": "Lata", "de": "Dose"}'::jsonb,true,220),
(23,'soft','🥭',2,'{}'::text[],'{}'::text[],'{"it": "Nestea mango e ananas", "en": "Nestea mango & pineapple", "es": "Nestea mango y piña", "de": "Nestea Mango-Ananas"}'::jsonb,'{"it": "Lattina", "en": "Can", "es": "Lata", "de": "Dose"}'::jsonb,true,230),
(24,'soft','🍋',2,'{}'::text[],'{}'::text[],'{"it": "Nestea limone", "en": "Nestea lemon", "es": "Nestea limón", "de": "Nestea Zitrone"}'::jsonb,'{"it": "Lattina", "en": "Can", "es": "Lata", "de": "Dose"}'::jsonb,true,240),
(25,'soft','🫧',2,'{}'::text[],'{}'::text[],'{"it": "Acqua tonica", "en": "Tonic water", "es": "Tónica", "de": "Tonic Water"}'::jsonb,'{"it": "Lattina", "en": "Can", "es": "Lata", "de": "Dose"}'::jsonb,true,250),
(26,'soft','⚡',2.5,'{}'::text[],'{}'::text[],'{"it": "Red Bull", "en": "Red Bull", "es": "Red Bull", "de": "Red Bull"}'::jsonb,'{"it": "Lattina", "en": "Can", "es": "Lata", "de": "Dose"}'::jsonb,true,260),
(27,'primi','🍅',8,array['gl']::text[],array['veg']::text[],'{"it": "Spaghetti o penne al pomodoro fresco e basilico", "en": "Spaghetti or penne with fresh tomato & basil", "es": "Espaguetis o macarrones con tomate fresco y albahaca", "de": "Spaghetti oder Penne mit frischen Tomaten & Basilikum"}'::jsonb,'{"it": "", "en": "", "es": "", "de": ""}'::jsonb,true,270),
(28,'primi','🍝',8,array['gl','eg','mi']::text[],array['pop']::text[],'{"it": "Spaghetti alla carbonara romana", "en": "Spaghetti carbonara (Roman style)", "es": "Espaguetis a la carbonara romana", "de": "Spaghetti Carbonara nach römischer Art"}'::jsonb,'{"it": "Guanciale, uova e pecorino", "en": "Guanciale, egg and pecorino", "es": "Guanciale, huevo y pecorino", "de": "Guanciale, Ei und Pecorino"}'::jsonb,true,280),
(29,'primi','🌿',8,array['gl','mi','nu']::text[],array['veg']::text[],'{"it": "Spaghetti al pesto", "en": "Spaghetti with pesto", "es": "Espaguetis al pesto", "de": "Spaghetti mit Pesto"}'::jsonb,'{"it": "", "en": "", "es": "", "de": ""}'::jsonb,true,290),
(30,'primi','🍝',8,array['gl','mi']::text[],'{}'::text[],'{"it": "Spaghetti o penne all''amatriciana", "en": "Spaghetti or penne amatriciana", "es": "Espaguetis o macarrones a la amatriciana", "de": "Spaghetti oder Penne Amatriciana"}'::jsonb,'{"it": "Pomodoro e guanciale", "en": "Tomato and guanciale", "es": "Tomate y guanciale", "de": "Tomate und Guanciale"}'::jsonb,true,300),
(31,'primi','🫒',8,array['gl']::text[],array['veg']::text[],'{"it": "Spaghetti o penne alla puttanesca", "en": "Spaghetti or penne puttanesca", "es": "Espaguetis o macarrones a la puttanesca", "de": "Spaghetti oder Penne Puttanesca"}'::jsonb,'{"it": "Olive, capperi e basilico", "en": "Olives, capers and basil", "es": "Aceitunas, alcaparras y albahaca", "de": "Oliven, Kapern und Basilikum"}'::jsonb,true,310),
(32,'primi','🍄',8,array['gl']::text[],'{}'::text[],'{"it": "Spaghetti o penne salsiccia, funghi e piselli", "en": "Spaghetti or penne with sausage, mushrooms & peas", "es": "Espaguetis o macarrones con salchicha, champiñones y guisantes", "de": "Spaghetti oder Penne mit Wurst, Pilzen & Erbsen"}'::jsonb,'{"it": "", "en": "", "es": "", "de": ""}'::jsonb,true,320),
(33,'primi','🐟',8,array['gl','fi']::text[],'{}'::text[],'{"it": "Spaghetti o penne al tonno", "en": "Spaghetti or penne with tuna", "es": "Espaguetis o macarrones con atún", "de": "Spaghetti oder Penne mit Thunfisch"}'::jsonb,'{"it": "Tonno, olive nere e capperi", "en": "Tuna, black olives and capers", "es": "Atún, aceitunas negras y alcaparras", "de": "Thunfisch, schwarze Oliven und Kapern"}'::jsonb,true,330),
(34,'primi','🫕',8,array['gl','eg','mi','ce']::text[],array['pop']::text[],'{"it": "Lasagna alla bolognese", "en": "Lasagne bolognese", "es": "Lasaña boloñesa", "de": "Lasagne Bolognese"}'::jsonb,'{"it": "", "en": "", "es": "", "de": ""}'::jsonb,true,340),
(35,'primi','🐚',10,array['gl','mo']::text[],'{}'::text[],'{"it": "Spaghetti alle vongole", "en": "Spaghetti with clams", "es": "Espaguetis con almejas", "de": "Spaghetti mit Venusmuscheln"}'::jsonb,'{"it": "", "en": "", "es": "", "de": ""}'::jsonb,true,350),
(36,'primi','🦐',10,array['gl','cr']::text[],'{}'::text[],'{"it": "Spaghetti con gamberi", "en": "Spaghetti with prawns", "es": "Espaguetis con gambas", "de": "Spaghetti mit Garnelen"}'::jsonb,'{"it": "", "en": "", "es": "", "de": ""}'::jsonb,true,360),
(37,'secondi','🍗',6,array['gl','eg']::text[],'{}'::text[],'{"it": "Cotoletta di pollo", "en": "Breaded chicken cutlet", "es": "Escalope de pollo empanado", "de": "Paniertes Hähnchenschnitzel"}'::jsonb,'{"it": "", "en": "", "es": "", "de": ""}'::jsonb,true,370),
(38,'secondi','🍔',6,'{}'::text[],'{}'::text[],'{"it": "Hamburger di manzo o misto maiale e manzo", "en": "Beef or pork & beef patty", "es": "Hamburguesa de ternera o mixta cerdo y ternera", "de": "Patty vom Rind oder Rind & Schwein"}'::jsonb,'{"it": "", "en": "", "es": "", "de": ""}'::jsonb,true,380),
(39,'secondi','🍗',6,'{}'::text[],'{}'::text[],'{"it": "Petto di pollo alla piastra", "en": "Grilled chicken breast", "es": "Pechuga de pollo a la plancha", "de": "Gegrillte Hähnchenbrust"}'::jsonb,'{"it": "", "en": "", "es": "", "de": ""}'::jsonb,true,390),
(40,'secondi','🐟',6,array['fi','gl','eg']::text[],'{}'::text[],'{"it": "Merluzzo impanato", "en": "Breaded cod", "es": "Bacalao empanado", "de": "Panierter Kabeljau"}'::jsonb,'{"it": "", "en": "", "es": "", "de": ""}'::jsonb,true,400),
(41,'secondi','🍖',8,array['gl','eg','mi']::text[],'{}'::text[],'{"it": "Polpette al sugo", "en": "Meatballs in tomato sauce", "es": "Albóndigas en salsa de tomate", "de": "Fleischbällchen in Tomatensoße"}'::jsonb,'{"it": "", "en": "", "es": "", "de": ""}'::jsonb,true,410),
(42,'secondi','🥩',8,'{}'::text[],'{}'::text[],'{"it": "Carne alla pizzaiola", "en": "Beef pizzaiola", "es": "Carne a la pizzaiola", "de": "Rindfleisch Pizzaiola"}'::jsonb,'{"it": "Con pomodoro e origano", "en": "With tomato and oregano", "es": "Con tomate y orégano", "de": "Mit Tomate und Oregano"}'::jsonb,true,420),
(43,'contorni','🍆',8,array['mi','gl','eg']::text[],array['pop','veg']::text[],'{"it": "Parmigiana di melanzane", "en": "Aubergine parmigiana", "es": "Parmesana de berenjena", "de": "Auberginen-Parmigiana"}'::jsonb,'{"it": "", "en": "", "es": "", "de": ""}'::jsonb,true,430),
(44,'contorni','🥒',8,array['mi','gl','eg']::text[],array['veg']::text[],'{"it": "Parmigiana di zucchine", "en": "Courgette parmigiana", "es": "Parmesana de calabacín", "de": "Zucchini-Parmigiana"}'::jsonb,'{"it": "", "en": "", "es": "", "de": ""}'::jsonb,true,440),
(45,'contorni','🍟',5,'{}'::text[],array['vegan']::text[],'{"it": "Patatine fritte", "en": "French fries", "es": "Patatas fritas", "de": "Pommes frites"}'::jsonb,'{"it": "", "en": "", "es": "", "de": ""}'::jsonb,true,450),
(46,'contorni','🥔',5,'{}'::text[],array['vegan']::text[],'{"it": "Patate saltate in padella", "en": "Pan-fried potatoes", "es": "Patatas salteadas", "de": "Bratkartoffeln"}'::jsonb,'{"it": "", "en": "", "es": "", "de": ""}'::jsonb,true,460),
(47,'contorni','🥬',5,'{}'::text[],array['vegan']::text[],'{"it": "Insalata verde", "en": "Green salad", "es": "Ensalada verde", "de": "Grüner Salat"}'::jsonb,'{"it": "", "en": "", "es": "", "de": ""}'::jsonb,true,470),
(48,'contorni','🥗',8,array['fi']::text[],'{}'::text[],'{"it": "Insalatona", "en": "Big salad", "es": "Ensalada completa", "de": "Großer Salat"}'::jsonb,'{"it": "Insalata verde, pomodoro, olive, cipolla e tonno", "en": "Green salad, tomato, olives, onion and tuna", "es": "Ensalada verde, tomate, aceitunas, cebolla y atún", "de": "Grüner Salat, Tomate, Oliven, Zwiebel und Thunfisch"}'::jsonb,true,480),
(49,'panini','🍔',8,array['gl','mi']::text[],array['pop']::text[],'{"it": "Hamburger cheddar e bacon", "en": "Cheddar & bacon burger", "es": "Hamburguesa con cheddar y bacon", "de": "Cheddar-Bacon-Burger"}'::jsonb,'{"it": "Con insalata e pomodoro", "en": "With lettuce and tomato", "es": "Con lechuga y tomate", "de": "Mit Salat und Tomate"}'::jsonb,true,490),
(50,'panini','🍔',8,array['gl','mi']::text[],'{}'::text[],'{"it": "Hamburger cheddar e patatine", "en": "Cheddar burger with fries", "es": "Hamburguesa con cheddar y patatas", "de": "Cheddar-Burger mit Pommes"}'::jsonb,'{"it": "", "en": "", "es": "", "de": ""}'::jsonb,true,500),
(51,'panini','🥪',10,array['gl','mi','eg']::text[],array['veg']::text[],'{"it": "Panino con parmigiana di melanzane", "en": "Aubergine parmigiana sandwich", "es": "Bocadillo de parmesana de berenjena", "de": "Sandwich mit Auberginen-Parmigiana"}'::jsonb,'{"it": "", "en": "", "es": "", "de": ""}'::jsonb,true,510),
(52,'panini','🥪',10,array['gl','mi','eg']::text[],array['veg']::text[],'{"it": "Panino con parmigiana di zucchine", "en": "Courgette parmigiana sandwich", "es": "Bocadillo de parmesana de calabacín", "de": "Sandwich mit Zucchini-Parmigiana"}'::jsonb,'{"it": "", "en": "", "es": "", "de": ""}'::jsonb,true,520),
(53,'panini','🌭',8,array['gl']::text[],'{}'::text[],'{"it": "Panino salsiccia e friarielli", "en": "Sausage & friarielli sandwich", "es": "Bocadillo de salchicha y grelos", "de": "Sandwich mit Wurst und Friarielli"}'::jsonb,'{"it": "Tipico napoletano", "en": "Neapolitan classic", "es": "Clásico napolitano", "de": "Neapolitanischer Klassiker"}'::jsonb,true,530),
(54,'panini','🥪',8,array['gl','mi']::text[],'{}'::text[],'{"it": "Panino prosciutto e formaggio", "en": "Ham & cheese sandwich", "es": "Bocadillo de jamón y queso", "de": "Schinken-Käse-Sandwich"}'::jsonb,'{"it": "", "en": "", "es": "", "de": ""}'::jsonb,true,540),
(55,'panini','🥪',8,array['gl']::text[],'{}'::text[],'{"it": "Panino salsiccia e patate saltate", "en": "Sausage & sautéed potato sandwich", "es": "Bocadillo de salchicha y patatas salteadas", "de": "Sandwich mit Wurst und Bratkartoffeln"}'::jsonb,'{"it": "", "en": "", "es": "", "de": ""}'::jsonb,true,550),
(56,'panini','🌭',4,array['gl','mu']::text[],'{}'::text[],'{"it": "Hot dog", "en": "Hot dog", "es": "Perrito caliente", "de": "Hotdog"}'::jsonb,'{"it": "", "en": "", "es": "", "de": ""}'::jsonb,true,560)
on conflict (id) do nothing;

create or replace function public.menu_public() returns jsonb
language sql security definer set search_path = public stable as $$
  select coalesce(jsonb_agg(jsonb_build_object('id',id,'c',c,'i',i,'p',p,'a',a,'t',t,'n',n,'d',d,'av',available) order by sort, id), '[]'::jsonb)
  from menu_items
$$;

create or replace function public.admin_save_item(p_pin text, p_item jsonb) returns jsonb
language plpgsql security definer set search_path = public as $$
declare e text := _pin_err(p_pin); v_id int; v_sort int;
begin
  if e is not null then return jsonb_build_object('error', e); end if;
  if coalesce(trim(coalesce(p_item->'n'->>'it','') || coalesce(p_item->'n'->>'es','') || coalesce(p_item->'n'->>'en','') || coalesce(p_item->'n'->>'de','')),'') = '' then
    return jsonb_build_object('error','no_name');
  end if;
  v_id := nullif(p_item->>'id','')::int;
  if v_id is null then
    select coalesce(max(id),0)+1 into v_id from menu_items;
    select coalesce(max(sort),0)+10 into v_sort from menu_items where c = p_item->>'c';
    insert into menu_items(id,c,i,p,a,t,n,d,available,sort)
    values (v_id, p_item->>'c', coalesce(nullif(p_item->>'i',''),'🍽'), (p_item->>'p')::numeric,
      coalesce(array(select jsonb_array_elements_text(p_item->'a')),'{}'),
      coalesce(array(select jsonb_array_elements_text(p_item->'t')),'{}'),
      p_item->'n', coalesce(p_item->'d','{}'::jsonb), coalesce((p_item->>'av')::boolean,true), coalesce(v_sort,0));
  else
    update menu_items set c = p_item->>'c', i = coalesce(nullif(p_item->>'i',''),'🍽'), p = (p_item->>'p')::numeric,
      a = coalesce(array(select jsonb_array_elements_text(p_item->'a')),'{}'),
      t = coalesce(array(select jsonb_array_elements_text(p_item->'t')),'{}'),
      n = p_item->'n', d = coalesce(p_item->'d','{}'::jsonb), available = coalesce((p_item->>'av')::boolean,true), updated_at = now()
    where id = v_id;
  end if;
  return jsonb_build_object('ok', true, 'id', v_id);
end $$;

create or replace function public.admin_set_available(p_pin text, p_id int, p_av boolean) returns jsonb
language plpgsql security definer set search_path = public as $$
declare e text := _pin_err(p_pin);
begin
  if e is not null then return jsonb_build_object('error', e); end if;
  update menu_items set available = p_av, updated_at = now() where id = p_id;
  return jsonb_build_object('ok', true);
end $$;

create or replace function public.admin_delete_item(p_pin text, p_id int) returns jsonb
language plpgsql security definer set search_path = public as $$
declare e text := _pin_err(p_pin);
begin
  if e is not null then return jsonb_build_object('error', e); end if;
  delete from menu_items where id = p_id;
  return jsonb_build_object('ok', true);
end $$;

create or replace function public.admin_move_item(p_pin text, p_id int, p_dir int) returns jsonb
language plpgsql security definer set search_path = public as $$
declare e text := _pin_err(p_pin); r menu_items; o menu_items;
begin
  if e is not null then return jsonb_build_object('error', e); end if;
  select * into r from menu_items where id = p_id;
  if p_dir < 0 then
    select * into o from menu_items where c = r.c and (sort, id) < (r.sort, r.id) order by sort desc, id desc limit 1;
  else
    select * into o from menu_items where c = r.c and (sort, id) > (r.sort, r.id) order by sort, id limit 1;
  end if;
  if o.id is not null then
    update menu_items set sort = o.sort where id = r.id;
    update menu_items set sort = r.sort where id = o.id;
    if o.sort = r.sort then update menu_items set sort = sort + p_dir where id = r.id; end if;
  end if;
  return jsonb_build_object('ok', true);
end $$;

grant execute on function public.menu_public(), public.admin_save_item(text,jsonb),
  public.admin_set_available(text,int,boolean), public.admin_delete_item(text,int),
  public.admin_move_item(text,int,int) to anon;
