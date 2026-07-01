///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'strings.g.dart';

// Path: <root>
class TranslationsAr with BaseTranslations<AppLocale, Translations> implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsAr({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
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

	late final TranslationsAr _root = this; // ignore: unused_field

	@override 
	TranslationsAr $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsAr(meta: meta ?? this.$meta);

	// Translations
	@override late final _Translations$landing$ar landing = _Translations$landing$ar._(_root);
	@override late final _Translations$note_editor$ar note_editor = _Translations$note_editor$ar._(_root);
	@override late final _Translations$archive$ar archive = _Translations$archive$ar._(_root);
	@override late final _Translations$common$ar common = _Translations$common$ar._(_root);
}

// Path: landing
class _Translations$landing$ar implements Translations$landing$en {
	_Translations$landing$ar._(this._root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'ملاحظاتي';
	@override String get search_hint => 'البحث في الملاحظات...';
	@override String get no_notes => 'لا توجد ملاحظات بعد. اضغط على + لإضافة واحدة!';
	@override String get pinned => 'المثبتة';
	@override String get others => 'الأخرى';
}

// Path: note_editor
class _Translations$note_editor$ar implements Translations$note_editor$en {
	_Translations$note_editor$ar._(this._root);

	final TranslationsAr _root; // ignore: unused_field

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
class _Translations$archive$ar implements Translations$archive$en {
	_Translations$archive$ar._(this._root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'الأرشيف';
	@override String get no_archived => 'لا توجد ملاحظات مؤرشفة.';
}

// Path: common
class _Translations$common$ar implements Translations$common$en {
	_Translations$common$ar._(this._root);

	final TranslationsAr _root; // ignore: unused_field

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

/// The flat map containing all translations for locale <ar>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsAr {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'landing.title' => 'ملاحظاتي',
			'landing.search_hint' => 'البحث في الملاحظات...',
			'landing.no_notes' => 'لا توجد ملاحظات بعد. اضغط على + لإضافة واحدة!',
			'landing.pinned' => 'المثبتة',
			'landing.others' => 'الأخرى',
			'note_editor.title_hint' => 'العنوان',
			'note_editor.content_hint' => 'ابدأ الكتابة...',
			'note_editor.save' => 'حفظ',
			'note_editor.discard' => 'تجاهل',
			'note_editor.edit_title' => 'تعديل الملاحظة',
			'note_editor.new_title' => 'ملاحظة جديدة',
			'note_editor.attachments' => 'المرفقات',
			'archive.title' => 'الأرشيف',
			'archive.no_archived' => 'لا توجد ملاحظات مؤرشفة.',
			'common.delete' => 'حذف',
			'common.archive' => 'أرشفة',
			'common.restore' => 'استعادة',
			'common.cancel' => 'إلغاء',
			'common.confirm_delete_title' => 'حذف الملاحظة؟',
			'common.confirm_delete_message' => 'هل أنت متأكد أنك تريد حذف هذه الملاحظة نهائيًا؟',
			'common.confirm_delete_all_title' => 'حذف جميع الملاحظات؟',
			'common.confirm_delete_all_message' => 'سيؤدي هذا إلى حذف جميع ملاحظاتك نهائيًا. لا يمكن التراجع عن هذا الإجراء.',
			_ => null,
		};
	}
}
