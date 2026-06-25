/// Generated file. Do not edit.
///
/// Original: lib/core/l10n
/// To regenerate, run: `dart run slang`
///
/// Locales: 2
/// Strings: 44 (22 per locale)
///
/// Built on 2026-06-25 at 14:30 UTC

// coverage:ignore-file
// ignore_for_file: type=lint

import 'package:flutter/widgets.dart';
import 'package:slang/builder/model/node.dart';
import 'package:slang_flutter/slang_flutter.dart';
export 'package:slang_flutter/slang_flutter.dart';

const AppLocale _baseLocale = AppLocale.en;

/// Supported locales, see extension methods below.
///
/// Usage:
/// - LocaleSettings.setLocale(AppLocale.en) // set locale
/// - Locale locale = AppLocale.en.flutterLocale // get flutter locale from enum
/// - if (LocaleSettings.currentLocale == AppLocale.en) // locale check
enum AppLocale with BaseAppLocale<AppLocale, Translations> {
	en(languageCode: 'en', build: Translations.build),
	ar(languageCode: 'ar', build: _StringsAr.build);

	const AppLocale({required this.languageCode, this.scriptCode, this.countryCode, required this.build}); // ignore: unused_element

	@override final String languageCode;
	@override final String? scriptCode;
	@override final String? countryCode;
	@override final TranslationBuilder<AppLocale, Translations> build;

	/// Gets current instance managed by [LocaleSettings].
	Translations get translations => LocaleSettings.instance.translationMap[this]!;
}

/// Method A: Simple
///
/// No rebuild after locale change.
/// Translation happens during initialization of the widget (call of t).
/// Configurable via 'translate_var'.
///
/// Usage:
/// String a = t.someKey.anotherKey;
/// String b = t['someKey.anotherKey']; // Only for edge cases!
Translations get t => LocaleSettings.instance.currentTranslations;

/// Method B: Advanced
///
/// All widgets using this method will trigger a rebuild when locale changes.
/// Use this if you have e.g. a settings page where the user can select the locale during runtime.
///
/// Step 1:
/// wrap your App with
/// TranslationProvider(
/// 	child: MyApp()
/// );
///
/// Step 2:
/// final t = Translations.of(context); // Get t variable.
/// String a = t.someKey.anotherKey; // Use t variable.
/// String b = t['someKey.anotherKey']; // Only for edge cases!
class TranslationProvider extends BaseTranslationProvider<AppLocale, Translations> {
	TranslationProvider({required super.child}) : super(settings: LocaleSettings.instance);

	static InheritedLocaleData<AppLocale, Translations> of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context);
}

/// Method B shorthand via [BuildContext] extension method.
/// Configurable via 'translate_var'.
///
/// Usage (e.g. in a widget's build method):
/// context.t.someKey.anotherKey
extension BuildContextTranslationsExtension on BuildContext {
	Translations get t => TranslationProvider.of(this).translations;
}

/// Manages all translation instances and the current locale
class LocaleSettings extends BaseFlutterLocaleSettings<AppLocale, Translations> {
	LocaleSettings._() : super(utils: AppLocaleUtils.instance);

	static final instance = LocaleSettings._();

	// static aliases (checkout base methods for documentation)
	static AppLocale get currentLocale => instance.currentLocale;
	static Stream<AppLocale> getLocaleStream() => instance.getLocaleStream();
	static AppLocale setLocale(AppLocale locale, {bool? listenToDeviceLocale = false}) => instance.setLocale(locale, listenToDeviceLocale: listenToDeviceLocale);
	static AppLocale setLocaleRaw(String rawLocale, {bool? listenToDeviceLocale = false}) => instance.setLocaleRaw(rawLocale, listenToDeviceLocale: listenToDeviceLocale);
	static AppLocale useDeviceLocale() => instance.useDeviceLocale();
	@Deprecated('Use [AppLocaleUtils.supportedLocales]') static List<Locale> get supportedLocales => instance.supportedLocales;
	@Deprecated('Use [AppLocaleUtils.supportedLocalesRaw]') static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
	static void setPluralResolver({String? language, AppLocale? locale, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver}) => instance.setPluralResolver(
		language: language,
		locale: locale,
		cardinalResolver: cardinalResolver,
		ordinalResolver: ordinalResolver,
	);
}

/// Provides utility functions without any side effects.
class AppLocaleUtils extends BaseAppLocaleUtils<AppLocale, Translations> {
	AppLocaleUtils._() : super(baseLocale: _baseLocale, locales: AppLocale.values);

	static final instance = AppLocaleUtils._();

	// static aliases (checkout base methods for documentation)
	static AppLocale parse(String rawLocale) => instance.parse(rawLocale);
	static AppLocale parseLocaleParts({required String languageCode, String? scriptCode, String? countryCode}) => instance.parseLocaleParts(languageCode: languageCode, scriptCode: scriptCode, countryCode: countryCode);
	static AppLocale findDeviceLocale() => instance.findDeviceLocale();
	static List<Locale> get supportedLocales => instance.supportedLocales;
	static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
}

// translations

// Path: <root>
class Translations implements BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	// Translations
	late final _StringsLandingEn landing = _StringsLandingEn._(_root);
	late final _StringsNoteEditorEn note_editor = _StringsNoteEditorEn._(_root);
	late final _StringsArchiveEn archive = _StringsArchiveEn._(_root);
	late final _StringsCommonEn common = _StringsCommonEn._(_root);
}

// Path: landing
class _StringsLandingEn {
	_StringsLandingEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'My Notes';
	String get search_hint => 'Search notes...';
	String get no_notes => 'No notes yet. Tap + to add one!';
	String get pinned => 'Pinned';
	String get others => 'Others';
}

// Path: note_editor
class _StringsNoteEditorEn {
	_StringsNoteEditorEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title_hint => 'Title';
	String get content_hint => 'Start typing...';
	String get save => 'Save';
	String get discard => 'Discard';
	String get edit_title => 'Edit Note';
	String get new_title => 'New Note';
	String get attachments => 'Attachments';
}

// Path: archive
class _StringsArchiveEn {
	_StringsArchiveEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Archive';
	String get no_archived => 'No archived notes.';
}

// Path: common
class _StringsCommonEn {
	_StringsCommonEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get delete => 'Delete';
	String get archive => 'Archive';
	String get restore => 'Restore';
	String get cancel => 'Cancel';
	String get confirm_delete_title => 'Delete Note?';
	String get confirm_delete_message => 'Are you sure you want to permanently delete this note?';
	String get confirm_delete_all_title => 'Delete All Notes?';
	String get confirm_delete_all_message => 'This will permanently delete all your notes. This action cannot be undone.';
}

// Path: <root>
class _StringsAr implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsAr.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.ar,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ar>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	@override late final _StringsAr _root = this; // ignore: unused_field

	// Translations
	@override late final _StringsLandingAr landing = _StringsLandingAr._(_root);
	@override late final _StringsNoteEditorAr note_editor = _StringsNoteEditorAr._(_root);
	@override late final _StringsArchiveAr archive = _StringsArchiveAr._(_root);
	@override late final _StringsCommonAr common = _StringsCommonAr._(_root);
}

// Path: landing
class _StringsLandingAr implements _StringsLandingEn {
	_StringsLandingAr._(this._root);

	@override final _StringsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'ملاحظاتي';
	@override String get search_hint => 'البحث في الملاحظات...';
	@override String get no_notes => 'لا توجد ملاحظات بعد. اضغط على + لإضافة واحدة!';
	@override String get pinned => 'المثبتة';
	@override String get others => 'الأخرى';
}

// Path: note_editor
class _StringsNoteEditorAr implements _StringsNoteEditorEn {
	_StringsNoteEditorAr._(this._root);

	@override final _StringsAr _root; // ignore: unused_field

	// Translations
	@override String get title_hint => 'العنوان';
	@override String get content_hint => 'ابدأ الكتابة...';
	@override String get save => 'حفظ';
	@override String get discard => 'تجاهل';
	@override String get edit_title => 'تعديل الملاحظة';
	@override String get new_title => 'ملاحظة جديدة';
	@override String get attachments => 'المرفقات';
}

// Path: archive
class _StringsArchiveAr implements _StringsArchiveEn {
	_StringsArchiveAr._(this._root);

	@override final _StringsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'الأرشيف';
	@override String get no_archived => 'لا توجد ملاحظات مؤرشفة.';
}

// Path: common
class _StringsCommonAr implements _StringsCommonEn {
	_StringsCommonAr._(this._root);

	@override final _StringsAr _root; // ignore: unused_field

	// Translations
	@override String get delete => 'حذف';
	@override String get archive => 'أرشفة';
	@override String get restore => 'استعادة';
	@override String get cancel => 'إلغاء';
	@override String get confirm_delete_title => 'حذف الملاحظة؟';
	@override String get confirm_delete_message => 'هل أنت متأكد أنك تريد حذف هذه الملاحظة نهائيًا؟';
	@override String get confirm_delete_all_title => 'حذف جميع الملاحظات؟';
	@override String get confirm_delete_all_message => 'سيؤدي هذا إلى حذف جميع ملاحظاتك نهائيًا. لا يمكن التراجع عن هذا الإجراء.';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.

extension on Translations {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'landing.title': return 'My Notes';
			case 'landing.search_hint': return 'Search notes...';
			case 'landing.no_notes': return 'No notes yet. Tap + to add one!';
			case 'landing.pinned': return 'Pinned';
			case 'landing.others': return 'Others';
			case 'note_editor.title_hint': return 'Title';
			case 'note_editor.content_hint': return 'Start typing...';
			case 'note_editor.save': return 'Save';
			case 'note_editor.discard': return 'Discard';
			case 'note_editor.edit_title': return 'Edit Note';
			case 'note_editor.new_title': return 'New Note';
			case 'note_editor.attachments': return 'Attachments';
			case 'archive.title': return 'Archive';
			case 'archive.no_archived': return 'No archived notes.';
			case 'common.delete': return 'Delete';
			case 'common.archive': return 'Archive';
			case 'common.restore': return 'Restore';
			case 'common.cancel': return 'Cancel';
			case 'common.confirm_delete_title': return 'Delete Note?';
			case 'common.confirm_delete_message': return 'Are you sure you want to permanently delete this note?';
			case 'common.confirm_delete_all_title': return 'Delete All Notes?';
			case 'common.confirm_delete_all_message': return 'This will permanently delete all your notes. This action cannot be undone.';
			default: return null;
		}
	}
}

extension on _StringsAr {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'landing.title': return 'ملاحظاتي';
			case 'landing.search_hint': return 'البحث في الملاحظات...';
			case 'landing.no_notes': return 'لا توجد ملاحظات بعد. اضغط على + لإضافة واحدة!';
			case 'landing.pinned': return 'المثبتة';
			case 'landing.others': return 'الأخرى';
			case 'note_editor.title_hint': return 'العنوان';
			case 'note_editor.content_hint': return 'ابدأ الكتابة...';
			case 'note_editor.save': return 'حفظ';
			case 'note_editor.discard': return 'تجاهل';
			case 'note_editor.edit_title': return 'تعديل الملاحظة';
			case 'note_editor.new_title': return 'ملاحظة جديدة';
			case 'note_editor.attachments': return 'المرفقات';
			case 'archive.title': return 'الأرشيف';
			case 'archive.no_archived': return 'لا توجد ملاحظات مؤرشفة.';
			case 'common.delete': return 'حذف';
			case 'common.archive': return 'أرشفة';
			case 'common.restore': return 'استعادة';
			case 'common.cancel': return 'إلغاء';
			case 'common.confirm_delete_title': return 'حذف الملاحظة؟';
			case 'common.confirm_delete_message': return 'هل أنت متأكد أنك تريد حذف هذه الملاحظة نهائيًا؟';
			case 'common.confirm_delete_all_title': return 'حذف جميع الملاحظات؟';
			case 'common.confirm_delete_all_message': return 'سيؤدي هذا إلى حذف جميع ملاحظاتك نهائيًا. لا يمكن التراجع عن هذا الإجراء.';
			default: return null;
		}
	}
}
