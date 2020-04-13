{-# OPTIONS_GHC -w #-}
{-# OPTIONS_GHC -fno-warn-incomplete-patterns -fno-warn-overlapping-patterns #-}
module ParBNF where
import AbsBNF
import LexBNF
import ErrM
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.19.5

data HappyAbsSyn 
	= HappyTerminal (Token)
	| HappyErrorToken Int
	| HappyAbsSyn36 (Ident)
	| HappyAbsSyn37 (String)
	| HappyAbsSyn38 (Integer)
	| HappyAbsSyn39 (Char)
	| HappyAbsSyn40 (Double)
	| HappyAbsSyn41 (LGrammar)
	| HappyAbsSyn42 (LDef)
	| HappyAbsSyn43 ([LDef])
	| HappyAbsSyn44 ([Ident])
	| HappyAbsSyn45 (Grammar)
	| HappyAbsSyn46 ([Def])
	| HappyAbsSyn47 (Def)
	| HappyAbsSyn48 (Item)
	| HappyAbsSyn49 ([Item])
	| HappyAbsSyn50 (Cat)
	| HappyAbsSyn51 (Label)
	| HappyAbsSyn52 (LabelId)
	| HappyAbsSyn53 (ProfItem)
	| HappyAbsSyn54 (IntList)
	| HappyAbsSyn55 ([Integer])
	| HappyAbsSyn56 ([IntList])
	| HappyAbsSyn57 ([ProfItem])
	| HappyAbsSyn58 (Arg)
	| HappyAbsSyn59 ([Arg])
	| HappyAbsSyn60 (Separation)
	| HappyAbsSyn61 ([String])
	| HappyAbsSyn62 (Exp)
	| HappyAbsSyn65 ([Exp])
	| HappyAbsSyn67 (RHS)
	| HappyAbsSyn68 ([RHS])
	| HappyAbsSyn69 (MinimumSize)
	| HappyAbsSyn70 (Reg)

{- to allow type-synonyms as our monads (likely
 - with explicitly-specified bind and return)
 - in Haskell98, it seems that with
 - /type M a = .../, then /(HappyReduction M)/
 - is not allowed.  But Happy is a
 - code-generator that can just substitute it.
type HappyReduction m = 
	   Int 
	-> (Token)
	-> HappyState (Token) (HappyStk HappyAbsSyn -> [(Token)] -> m HappyAbsSyn)
	-> [HappyState (Token) (HappyStk HappyAbsSyn -> [(Token)] -> m HappyAbsSyn)] 
	-> HappyStk HappyAbsSyn 
	-> [(Token)] -> m HappyAbsSyn
-}

action_0,
 action_1,
 action_2,
 action_3,
 action_4,
 action_5,
 action_6,
 action_7,
 action_8,
 action_9,
 action_10,
 action_11,
 action_12,
 action_13,
 action_14,
 action_15,
 action_16,
 action_17,
 action_18,
 action_19,
 action_20,
 action_21,
 action_22,
 action_23,
 action_24,
 action_25,
 action_26,
 action_27,
 action_28,
 action_29,
 action_30,
 action_31,
 action_32,
 action_33,
 action_34,
 action_35,
 action_36,
 action_37,
 action_38,
 action_39,
 action_40,
 action_41,
 action_42,
 action_43,
 action_44,
 action_45,
 action_46,
 action_47,
 action_48,
 action_49,
 action_50,
 action_51,
 action_52,
 action_53,
 action_54,
 action_55,
 action_56,
 action_57,
 action_58,
 action_59,
 action_60,
 action_61,
 action_62,
 action_63,
 action_64,
 action_65,
 action_66,
 action_67,
 action_68,
 action_69,
 action_70,
 action_71,
 action_72,
 action_73,
 action_74,
 action_75,
 action_76,
 action_77,
 action_78,
 action_79,
 action_80,
 action_81,
 action_82,
 action_83,
 action_84,
 action_85,
 action_86,
 action_87,
 action_88,
 action_89,
 action_90,
 action_91,
 action_92,
 action_93,
 action_94,
 action_95,
 action_96,
 action_97,
 action_98,
 action_99,
 action_100,
 action_101,
 action_102,
 action_103,
 action_104,
 action_105,
 action_106,
 action_107,
 action_108,
 action_109,
 action_110,
 action_111,
 action_112,
 action_113,
 action_114,
 action_115,
 action_116,
 action_117,
 action_118,
 action_119,
 action_120,
 action_121,
 action_122,
 action_123,
 action_124,
 action_125,
 action_126,
 action_127,
 action_128,
 action_129,
 action_130,
 action_131,
 action_132,
 action_133,
 action_134,
 action_135,
 action_136,
 action_137,
 action_138,
 action_139,
 action_140,
 action_141,
 action_142,
 action_143,
 action_144,
 action_145,
 action_146,
 action_147,
 action_148,
 action_149,
 action_150,
 action_151,
 action_152,
 action_153,
 action_154,
 action_155,
 action_156,
 action_157,
 action_158,
 action_159,
 action_160,
 action_161,
 action_162,
 action_163,
 action_164,
 action_165,
 action_166,
 action_167,
 action_168,
 action_169,
 action_170,
 action_171,
 action_172,
 action_173,
 action_174,
 action_175,
 action_176,
 action_177,
 action_178,
 action_179,
 action_180,
 action_181,
 action_182,
 action_183,
 action_184,
 action_185,
 action_186,
 action_187,
 action_188,
 action_189,
 action_190,
 action_191,
 action_192,
 action_193,
 action_194,
 action_195,
 action_196,
 action_197,
 action_198,
 action_199,
 action_200,
 action_201,
 action_202,
 action_203,
 action_204,
 action_205,
 action_206,
 action_207,
 action_208,
 action_209,
 action_210,
 action_211,
 action_212,
 action_213,
 action_214,
 action_215,
 action_216,
 action_217,
 action_218,
 action_219,
 action_220,
 action_221,
 action_222,
 action_223,
 action_224,
 action_225,
 action_226,
 action_227,
 action_228,
 action_229,
 action_230,
 action_231,
 action_232,
 action_233,
 action_234,
 action_235,
 action_236,
 action_237,
 action_238,
 action_239,
 action_240,
 action_241,
 action_242,
 action_243,
 action_244,
 action_245,
 action_246,
 action_247,
 action_248,
 action_249,
 action_250,
 action_251,
 action_252 :: () => Int -> ({-HappyReduction (Err) = -}
	   Int 
	-> (Token)
	-> HappyState (Token) (HappyStk HappyAbsSyn -> [(Token)] -> (Err) HappyAbsSyn)
	-> [HappyState (Token) (HappyStk HappyAbsSyn -> [(Token)] -> (Err) HappyAbsSyn)] 
	-> HappyStk HappyAbsSyn 
	-> [(Token)] -> (Err) HappyAbsSyn)

happyReduce_33,
 happyReduce_34,
 happyReduce_35,
 happyReduce_36,
 happyReduce_37,
 happyReduce_38,
 happyReduce_39,
 happyReduce_40,
 happyReduce_41,
 happyReduce_42,
 happyReduce_43,
 happyReduce_44,
 happyReduce_45,
 happyReduce_46,
 happyReduce_47,
 happyReduce_48,
 happyReduce_49,
 happyReduce_50,
 happyReduce_51,
 happyReduce_52,
 happyReduce_53,
 happyReduce_54,
 happyReduce_55,
 happyReduce_56,
 happyReduce_57,
 happyReduce_58,
 happyReduce_59,
 happyReduce_60,
 happyReduce_61,
 happyReduce_62,
 happyReduce_63,
 happyReduce_64,
 happyReduce_65,
 happyReduce_66,
 happyReduce_67,
 happyReduce_68,
 happyReduce_69,
 happyReduce_70,
 happyReduce_71,
 happyReduce_72,
 happyReduce_73,
 happyReduce_74,
 happyReduce_75,
 happyReduce_76,
 happyReduce_77,
 happyReduce_78,
 happyReduce_79,
 happyReduce_80,
 happyReduce_81,
 happyReduce_82,
 happyReduce_83,
 happyReduce_84,
 happyReduce_85,
 happyReduce_86,
 happyReduce_87,
 happyReduce_88,
 happyReduce_89,
 happyReduce_90,
 happyReduce_91,
 happyReduce_92,
 happyReduce_93,
 happyReduce_94,
 happyReduce_95,
 happyReduce_96,
 happyReduce_97,
 happyReduce_98,
 happyReduce_99,
 happyReduce_100,
 happyReduce_101,
 happyReduce_102,
 happyReduce_103,
 happyReduce_104,
 happyReduce_105,
 happyReduce_106,
 happyReduce_107,
 happyReduce_108,
 happyReduce_109,
 happyReduce_110,
 happyReduce_111,
 happyReduce_112,
 happyReduce_113,
 happyReduce_114,
 happyReduce_115,
 happyReduce_116,
 happyReduce_117,
 happyReduce_118,
 happyReduce_119,
 happyReduce_120,
 happyReduce_121,
 happyReduce_122,
 happyReduce_123,
 happyReduce_124,
 happyReduce_125,
 happyReduce_126,
 happyReduce_127,
 happyReduce_128,
 happyReduce_129,
 happyReduce_130,
 happyReduce_131,
 happyReduce_132,
 happyReduce_133,
 happyReduce_134,
 happyReduce_135,
 happyReduce_136,
 happyReduce_137,
 happyReduce_138,
 happyReduce_139,
 happyReduce_140,
 happyReduce_141 :: () => ({-HappyReduction (Err) = -}
	   Int 
	-> (Token)
	-> HappyState (Token) (HappyStk HappyAbsSyn -> [(Token)] -> (Err) HappyAbsSyn)
	-> [HappyState (Token) (HappyStk HappyAbsSyn -> [(Token)] -> (Err) HappyAbsSyn)] 
	-> HappyStk HappyAbsSyn 
	-> [(Token)] -> (Err) HappyAbsSyn)

action_0 (74) = happyShift action_99
action_0 (83) = happyShift action_137
action_0 (86) = happyShift action_100
action_0 (88) = happyShift action_101
action_0 (90) = happyShift action_113
action_0 (91) = happyShift action_114
action_0 (92) = happyShift action_115
action_0 (93) = happyShift action_116
action_0 (95) = happyShift action_117
action_0 (97) = happyShift action_118
action_0 (98) = happyShift action_119
action_0 (102) = happyShift action_120
action_0 (103) = happyShift action_121
action_0 (104) = happyShift action_122
action_0 (106) = happyShift action_123
action_0 (107) = happyShift action_124
action_0 (110) = happyShift action_138
action_0 (114) = happyShift action_34
action_0 (36) = happyGoto action_132
action_0 (41) = happyGoto action_140
action_0 (42) = happyGoto action_133
action_0 (43) = happyGoto action_141
action_0 (44) = happyGoto action_135
action_0 (47) = happyGoto action_136
action_0 (51) = happyGoto action_112
action_0 (52) = happyGoto action_103
action_0 _ = happyReduce_42

action_1 (74) = happyShift action_99
action_1 (86) = happyShift action_100
action_1 (88) = happyShift action_101
action_1 (90) = happyShift action_113
action_1 (91) = happyShift action_114
action_1 (92) = happyShift action_115
action_1 (93) = happyShift action_116
action_1 (95) = happyShift action_117
action_1 (97) = happyShift action_118
action_1 (98) = happyShift action_119
action_1 (102) = happyShift action_120
action_1 (103) = happyShift action_121
action_1 (104) = happyShift action_122
action_1 (106) = happyShift action_123
action_1 (107) = happyShift action_124
action_1 (110) = happyShift action_138
action_1 (114) = happyShift action_34
action_1 (36) = happyGoto action_132
action_1 (42) = happyGoto action_139
action_1 (44) = happyGoto action_135
action_1 (47) = happyGoto action_136
action_1 (51) = happyGoto action_112
action_1 (52) = happyGoto action_103
action_1 _ = happyFail

action_2 (74) = happyShift action_99
action_2 (83) = happyShift action_137
action_2 (86) = happyShift action_100
action_2 (88) = happyShift action_101
action_2 (90) = happyShift action_113
action_2 (91) = happyShift action_114
action_2 (92) = happyShift action_115
action_2 (93) = happyShift action_116
action_2 (95) = happyShift action_117
action_2 (97) = happyShift action_118
action_2 (98) = happyShift action_119
action_2 (102) = happyShift action_120
action_2 (103) = happyShift action_121
action_2 (104) = happyShift action_122
action_2 (106) = happyShift action_123
action_2 (107) = happyShift action_124
action_2 (110) = happyShift action_138
action_2 (114) = happyShift action_34
action_2 (36) = happyGoto action_132
action_2 (42) = happyGoto action_133
action_2 (43) = happyGoto action_134
action_2 (44) = happyGoto action_135
action_2 (47) = happyGoto action_136
action_2 (51) = happyGoto action_112
action_2 (52) = happyGoto action_103
action_2 _ = happyReduce_42

action_3 (114) = happyShift action_34
action_3 (36) = happyGoto action_130
action_3 (44) = happyGoto action_131
action_3 _ = happyFail

action_4 (74) = happyShift action_99
action_4 (83) = happyShift action_127
action_4 (86) = happyShift action_100
action_4 (88) = happyShift action_101
action_4 (90) = happyShift action_113
action_4 (91) = happyShift action_114
action_4 (92) = happyShift action_115
action_4 (93) = happyShift action_116
action_4 (95) = happyShift action_117
action_4 (97) = happyShift action_118
action_4 (98) = happyShift action_119
action_4 (102) = happyShift action_120
action_4 (103) = happyShift action_121
action_4 (104) = happyShift action_122
action_4 (106) = happyShift action_123
action_4 (107) = happyShift action_124
action_4 (114) = happyShift action_34
action_4 (36) = happyGoto action_97
action_4 (45) = happyGoto action_128
action_4 (46) = happyGoto action_129
action_4 (47) = happyGoto action_126
action_4 (51) = happyGoto action_112
action_4 (52) = happyGoto action_103
action_4 _ = happyReduce_49

action_5 (74) = happyShift action_99
action_5 (83) = happyShift action_127
action_5 (86) = happyShift action_100
action_5 (88) = happyShift action_101
action_5 (90) = happyShift action_113
action_5 (91) = happyShift action_114
action_5 (92) = happyShift action_115
action_5 (93) = happyShift action_116
action_5 (95) = happyShift action_117
action_5 (97) = happyShift action_118
action_5 (98) = happyShift action_119
action_5 (102) = happyShift action_120
action_5 (103) = happyShift action_121
action_5 (104) = happyShift action_122
action_5 (106) = happyShift action_123
action_5 (107) = happyShift action_124
action_5 (114) = happyShift action_34
action_5 (36) = happyGoto action_97
action_5 (46) = happyGoto action_125
action_5 (47) = happyGoto action_126
action_5 (51) = happyGoto action_112
action_5 (52) = happyGoto action_103
action_5 _ = happyReduce_49

action_6 (74) = happyShift action_99
action_6 (86) = happyShift action_100
action_6 (88) = happyShift action_101
action_6 (90) = happyShift action_113
action_6 (91) = happyShift action_114
action_6 (92) = happyShift action_115
action_6 (93) = happyShift action_116
action_6 (95) = happyShift action_117
action_6 (97) = happyShift action_118
action_6 (98) = happyShift action_119
action_6 (102) = happyShift action_120
action_6 (103) = happyShift action_121
action_6 (104) = happyShift action_122
action_6 (106) = happyShift action_123
action_6 (107) = happyShift action_124
action_6 (114) = happyShift action_34
action_6 (36) = happyGoto action_97
action_6 (47) = happyGoto action_111
action_6 (51) = happyGoto action_112
action_6 (52) = happyGoto action_103
action_6 _ = happyFail

action_7 (86) = happyShift action_106
action_7 (114) = happyShift action_34
action_7 (115) = happyShift action_68
action_7 (36) = happyGoto action_104
action_7 (37) = happyGoto action_108
action_7 (48) = happyGoto action_109
action_7 (50) = happyGoto action_110
action_7 _ = happyFail

action_8 (49) = happyGoto action_107
action_8 _ = happyReduce_71

action_9 (86) = happyShift action_106
action_9 (114) = happyShift action_34
action_9 (36) = happyGoto action_104
action_9 (50) = happyGoto action_105
action_9 _ = happyFail

action_10 (74) = happyShift action_99
action_10 (86) = happyShift action_100
action_10 (88) = happyShift action_101
action_10 (114) = happyShift action_34
action_10 (36) = happyGoto action_97
action_10 (51) = happyGoto action_102
action_10 (52) = happyGoto action_103
action_10 _ = happyFail

action_11 (74) = happyShift action_99
action_11 (86) = happyShift action_100
action_11 (88) = happyShift action_101
action_11 (114) = happyShift action_34
action_11 (36) = happyGoto action_97
action_11 (52) = happyGoto action_98
action_11 _ = happyFail

action_12 (74) = happyShift action_89
action_12 (53) = happyGoto action_96
action_12 _ = happyFail

action_13 (86) = happyShift action_92
action_13 (54) = happyGoto action_95
action_13 _ = happyFail

action_14 (116) = happyShift action_69
action_14 (38) = happyGoto action_93
action_14 (55) = happyGoto action_94
action_14 _ = happyReduce_86

action_15 (86) = happyShift action_92
action_15 (54) = happyGoto action_90
action_15 (56) = happyGoto action_91
action_15 _ = happyReduce_89

action_16 (74) = happyShift action_89
action_16 (53) = happyGoto action_87
action_16 (57) = happyGoto action_88
action_16 _ = happyFail

action_17 (114) = happyShift action_34
action_17 (36) = happyGoto action_85
action_17 (58) = happyGoto action_86
action_17 _ = happyFail

action_18 (59) = happyGoto action_84
action_18 _ = happyReduce_95

action_19 (104) = happyShift action_82
action_19 (106) = happyShift action_83
action_19 (60) = happyGoto action_81
action_19 _ = happyReduce_97

action_20 (115) = happyShift action_68
action_20 (37) = happyGoto action_79
action_20 (61) = happyGoto action_80
action_20 _ = happyFail

action_21 (74) = happyShift action_66
action_21 (86) = happyShift action_67
action_21 (114) = happyShift action_34
action_21 (115) = happyShift action_68
action_21 (116) = happyShift action_69
action_21 (117) = happyShift action_49
action_21 (118) = happyShift action_70
action_21 (36) = happyGoto action_71
action_21 (37) = happyGoto action_60
action_21 (38) = happyGoto action_61
action_21 (39) = happyGoto action_62
action_21 (40) = happyGoto action_63
action_21 (62) = happyGoto action_78
action_21 (63) = happyGoto action_73
action_21 (64) = happyGoto action_74
action_21 _ = happyFail

action_22 (74) = happyShift action_66
action_22 (86) = happyShift action_67
action_22 (114) = happyShift action_34
action_22 (115) = happyShift action_68
action_22 (116) = happyShift action_69
action_22 (117) = happyShift action_49
action_22 (118) = happyShift action_70
action_22 (36) = happyGoto action_71
action_22 (37) = happyGoto action_60
action_22 (38) = happyGoto action_61
action_22 (39) = happyGoto action_62
action_22 (40) = happyGoto action_63
action_22 (63) = happyGoto action_77
action_22 (64) = happyGoto action_74
action_22 _ = happyFail

action_23 (74) = happyShift action_66
action_23 (86) = happyShift action_67
action_23 (114) = happyShift action_34
action_23 (115) = happyShift action_68
action_23 (116) = happyShift action_69
action_23 (117) = happyShift action_49
action_23 (118) = happyShift action_70
action_23 (36) = happyGoto action_59
action_23 (37) = happyGoto action_60
action_23 (38) = happyGoto action_61
action_23 (39) = happyGoto action_62
action_23 (40) = happyGoto action_63
action_23 (64) = happyGoto action_76
action_23 _ = happyFail

action_24 (74) = happyShift action_66
action_24 (86) = happyShift action_67
action_24 (114) = happyShift action_34
action_24 (115) = happyShift action_68
action_24 (116) = happyShift action_69
action_24 (117) = happyShift action_49
action_24 (118) = happyShift action_70
action_24 (36) = happyGoto action_71
action_24 (37) = happyGoto action_60
action_24 (38) = happyGoto action_61
action_24 (39) = happyGoto action_62
action_24 (40) = happyGoto action_63
action_24 (62) = happyGoto action_72
action_24 (63) = happyGoto action_73
action_24 (64) = happyGoto action_74
action_24 (65) = happyGoto action_75
action_24 _ = happyReduce_113

action_25 (74) = happyShift action_66
action_25 (86) = happyShift action_67
action_25 (114) = happyShift action_34
action_25 (115) = happyShift action_68
action_25 (116) = happyShift action_69
action_25 (117) = happyShift action_49
action_25 (118) = happyShift action_70
action_25 (36) = happyGoto action_59
action_25 (37) = happyGoto action_60
action_25 (38) = happyGoto action_61
action_25 (39) = happyGoto action_62
action_25 (40) = happyGoto action_63
action_25 (64) = happyGoto action_64
action_25 (66) = happyGoto action_65
action_25 _ = happyFail

action_26 (49) = happyGoto action_55
action_26 (67) = happyGoto action_58
action_26 _ = happyReduce_71

action_27 (49) = happyGoto action_55
action_27 (67) = happyGoto action_56
action_27 (68) = happyGoto action_57
action_27 _ = happyReduce_71

action_28 (101) = happyShift action_54
action_28 (69) = happyGoto action_53
action_28 _ = happyReduce_122

action_29 (74) = happyShift action_40
action_29 (86) = happyShift action_41
action_29 (89) = happyShift action_42
action_29 (94) = happyShift action_43
action_29 (96) = happyShift action_44
action_29 (99) = happyShift action_45
action_29 (100) = happyShift action_46
action_29 (109) = happyShift action_47
action_29 (111) = happyShift action_48
action_29 (117) = happyShift action_49
action_29 (39) = happyGoto action_35
action_29 (70) = happyGoto action_52
action_29 (72) = happyGoto action_38
action_29 _ = happyFail

action_30 (74) = happyShift action_40
action_30 (86) = happyShift action_41
action_30 (89) = happyShift action_42
action_30 (94) = happyShift action_43
action_30 (96) = happyShift action_44
action_30 (99) = happyShift action_45
action_30 (100) = happyShift action_46
action_30 (109) = happyShift action_47
action_30 (111) = happyShift action_48
action_30 (117) = happyShift action_49
action_30 (39) = happyGoto action_35
action_30 (70) = happyGoto action_36
action_30 (71) = happyGoto action_51
action_30 (72) = happyGoto action_38
action_30 _ = happyFail

action_31 (74) = happyShift action_40
action_31 (86) = happyShift action_41
action_31 (89) = happyShift action_42
action_31 (94) = happyShift action_43
action_31 (96) = happyShift action_44
action_31 (99) = happyShift action_45
action_31 (100) = happyShift action_46
action_31 (109) = happyShift action_47
action_31 (111) = happyShift action_48
action_31 (117) = happyShift action_49
action_31 (39) = happyGoto action_35
action_31 (72) = happyGoto action_50
action_31 _ = happyFail

action_32 (74) = happyShift action_40
action_32 (86) = happyShift action_41
action_32 (89) = happyShift action_42
action_32 (94) = happyShift action_43
action_32 (96) = happyShift action_44
action_32 (99) = happyShift action_45
action_32 (100) = happyShift action_46
action_32 (109) = happyShift action_47
action_32 (111) = happyShift action_48
action_32 (117) = happyShift action_49
action_32 (39) = happyGoto action_35
action_32 (70) = happyGoto action_36
action_32 (71) = happyGoto action_37
action_32 (72) = happyGoto action_38
action_32 (73) = happyGoto action_39
action_32 _ = happyFail

action_33 (114) = happyShift action_34
action_33 _ = happyFail

action_34 _ = happyReduce_33

action_35 _ = happyReduce_132

action_36 (74) = happyShift action_40
action_36 (79) = happyShift action_195
action_36 (86) = happyShift action_41
action_36 (89) = happyShift action_42
action_36 (94) = happyShift action_43
action_36 (96) = happyShift action_44
action_36 (99) = happyShift action_45
action_36 (100) = happyShift action_46
action_36 (109) = happyShift action_47
action_36 (111) = happyShift action_48
action_36 (117) = happyShift action_49
action_36 (39) = happyGoto action_35
action_36 (72) = happyGoto action_187
action_36 _ = happyReduce_127

action_37 (112) = happyShift action_188
action_37 _ = happyReduce_141

action_38 (76) = happyShift action_189
action_38 (77) = happyShift action_190
action_38 (85) = happyShift action_191
action_38 _ = happyReduce_124

action_39 (119) = happyAccept
action_39 _ = happyFail

action_40 (74) = happyShift action_40
action_40 (86) = happyShift action_41
action_40 (89) = happyShift action_42
action_40 (94) = happyShift action_43
action_40 (96) = happyShift action_44
action_40 (99) = happyShift action_45
action_40 (100) = happyShift action_46
action_40 (109) = happyShift action_47
action_40 (111) = happyShift action_48
action_40 (117) = happyShift action_49
action_40 (39) = happyGoto action_35
action_40 (70) = happyGoto action_36
action_40 (71) = happyGoto action_37
action_40 (72) = happyGoto action_38
action_40 (73) = happyGoto action_194
action_40 _ = happyFail

action_41 (115) = happyShift action_68
action_41 (37) = happyGoto action_193
action_41 _ = happyFail

action_42 _ = happyReduce_139

action_43 _ = happyReduce_135

action_44 _ = happyReduce_131

action_45 _ = happyReduce_136

action_46 _ = happyReduce_138

action_47 _ = happyReduce_137

action_48 (115) = happyShift action_68
action_48 (37) = happyGoto action_192
action_48 _ = happyFail

action_49 _ = happyReduce_36

action_50 (76) = happyShift action_189
action_50 (77) = happyShift action_190
action_50 (85) = happyShift action_191
action_50 (119) = happyAccept
action_50 _ = happyFail

action_51 (112) = happyShift action_188
action_51 (119) = happyAccept
action_51 _ = happyFail

action_52 (74) = happyShift action_40
action_52 (86) = happyShift action_41
action_52 (89) = happyShift action_42
action_52 (94) = happyShift action_43
action_52 (96) = happyShift action_44
action_52 (99) = happyShift action_45
action_52 (100) = happyShift action_46
action_52 (109) = happyShift action_47
action_52 (111) = happyShift action_48
action_52 (117) = happyShift action_49
action_52 (119) = happyAccept
action_52 (39) = happyGoto action_35
action_52 (72) = happyGoto action_187
action_52 _ = happyFail

action_53 (119) = happyAccept
action_53 _ = happyFail

action_54 _ = happyReduce_121

action_55 (86) = happyShift action_106
action_55 (114) = happyShift action_34
action_55 (115) = happyShift action_68
action_55 (36) = happyGoto action_104
action_55 (37) = happyGoto action_108
action_55 (48) = happyGoto action_164
action_55 (50) = happyGoto action_110
action_55 _ = happyReduce_118

action_56 (112) = happyShift action_186
action_56 _ = happyReduce_119

action_57 (119) = happyAccept
action_57 _ = happyFail

action_58 (119) = happyAccept
action_58 _ = happyFail

action_59 _ = happyReduce_106

action_60 _ = happyReduce_109

action_61 _ = happyReduce_107

action_62 _ = happyReduce_108

action_63 _ = happyReduce_110

action_64 (74) = happyShift action_66
action_64 (86) = happyShift action_67
action_64 (114) = happyShift action_34
action_64 (115) = happyShift action_68
action_64 (116) = happyShift action_69
action_64 (117) = happyShift action_49
action_64 (118) = happyShift action_70
action_64 (36) = happyGoto action_59
action_64 (37) = happyGoto action_60
action_64 (38) = happyGoto action_61
action_64 (39) = happyGoto action_62
action_64 (40) = happyGoto action_63
action_64 (64) = happyGoto action_64
action_64 (66) = happyGoto action_185
action_64 _ = happyReduce_116

action_65 (119) = happyAccept
action_65 _ = happyFail

action_66 (74) = happyShift action_66
action_66 (86) = happyShift action_67
action_66 (114) = happyShift action_34
action_66 (115) = happyShift action_68
action_66 (116) = happyShift action_69
action_66 (117) = happyShift action_49
action_66 (118) = happyShift action_70
action_66 (36) = happyGoto action_71
action_66 (37) = happyGoto action_60
action_66 (38) = happyGoto action_61
action_66 (39) = happyGoto action_62
action_66 (40) = happyGoto action_63
action_66 (62) = happyGoto action_184
action_66 (63) = happyGoto action_73
action_66 (64) = happyGoto action_74
action_66 _ = happyFail

action_67 (74) = happyShift action_66
action_67 (86) = happyShift action_67
action_67 (114) = happyShift action_34
action_67 (115) = happyShift action_68
action_67 (116) = happyShift action_69
action_67 (117) = happyShift action_49
action_67 (118) = happyShift action_70
action_67 (36) = happyGoto action_71
action_67 (37) = happyGoto action_60
action_67 (38) = happyGoto action_61
action_67 (39) = happyGoto action_62
action_67 (40) = happyGoto action_63
action_67 (62) = happyGoto action_72
action_67 (63) = happyGoto action_73
action_67 (64) = happyGoto action_74
action_67 (65) = happyGoto action_183
action_67 _ = happyReduce_113

action_68 _ = happyReduce_34

action_69 _ = happyReduce_35

action_70 _ = happyReduce_37

action_71 (74) = happyShift action_66
action_71 (86) = happyShift action_67
action_71 (114) = happyShift action_34
action_71 (115) = happyShift action_68
action_71 (116) = happyShift action_69
action_71 (117) = happyShift action_49
action_71 (118) = happyShift action_70
action_71 (36) = happyGoto action_59
action_71 (37) = happyGoto action_60
action_71 (38) = happyGoto action_61
action_71 (39) = happyGoto action_62
action_71 (40) = happyGoto action_63
action_71 (64) = happyGoto action_64
action_71 (66) = happyGoto action_182
action_71 _ = happyReduce_106

action_72 (78) = happyShift action_181
action_72 _ = happyReduce_114

action_73 (81) = happyShift action_180
action_73 _ = happyReduce_103

action_74 _ = happyReduce_105

action_75 (119) = happyAccept
action_75 _ = happyFail

action_76 (119) = happyAccept
action_76 _ = happyFail

action_77 (119) = happyAccept
action_77 _ = happyFail

action_78 (119) = happyAccept
action_78 _ = happyFail

action_79 (78) = happyShift action_179
action_79 _ = happyReduce_100

action_80 (119) = happyAccept
action_80 _ = happyFail

action_81 (119) = happyAccept
action_81 _ = happyFail

action_82 (115) = happyShift action_68
action_82 (37) = happyGoto action_178
action_82 _ = happyFail

action_83 (115) = happyShift action_68
action_83 (37) = happyGoto action_177
action_83 _ = happyFail

action_84 (114) = happyShift action_34
action_84 (119) = happyAccept
action_84 (36) = happyGoto action_85
action_84 (58) = happyGoto action_176
action_84 _ = happyFail

action_85 _ = happyReduce_94

action_86 (119) = happyAccept
action_86 _ = happyFail

action_87 (74) = happyShift action_89
action_87 (53) = happyGoto action_87
action_87 (57) = happyGoto action_175
action_87 _ = happyReduce_92

action_88 (119) = happyAccept
action_88 _ = happyFail

action_89 (86) = happyShift action_174
action_89 _ = happyFail

action_90 (78) = happyShift action_173
action_90 _ = happyReduce_90

action_91 (119) = happyAccept
action_91 _ = happyFail

action_92 (116) = happyShift action_69
action_92 (38) = happyGoto action_93
action_92 (55) = happyGoto action_172
action_92 _ = happyReduce_86

action_93 (78) = happyShift action_171
action_93 _ = happyReduce_87

action_94 (119) = happyAccept
action_94 _ = happyFail

action_95 (119) = happyAccept
action_95 _ = happyFail

action_96 (119) = happyAccept
action_96 _ = happyFail

action_97 _ = happyReduce_79

action_98 (119) = happyAccept
action_98 _ = happyFail

action_99 (81) = happyShift action_170
action_99 _ = happyFail

action_100 (87) = happyShift action_169
action_100 _ = happyFail

action_101 _ = happyReduce_80

action_102 (119) = happyAccept
action_102 _ = happyFail

action_103 (74) = happyShift action_168
action_103 (86) = happyShift action_100
action_103 (88) = happyShift action_101
action_103 (114) = happyShift action_34
action_103 (36) = happyGoto action_97
action_103 (52) = happyGoto action_166
action_103 (53) = happyGoto action_87
action_103 (57) = happyGoto action_167
action_103 _ = happyReduce_75

action_104 _ = happyReduce_74

action_105 (119) = happyAccept
action_105 _ = happyFail

action_106 (86) = happyShift action_106
action_106 (114) = happyShift action_34
action_106 (36) = happyGoto action_104
action_106 (50) = happyGoto action_165
action_106 _ = happyFail

action_107 (86) = happyShift action_106
action_107 (114) = happyShift action_34
action_107 (115) = happyShift action_68
action_107 (119) = happyAccept
action_107 (36) = happyGoto action_104
action_107 (37) = happyGoto action_108
action_107 (48) = happyGoto action_164
action_107 (50) = happyGoto action_110
action_107 _ = happyFail

action_108 _ = happyReduce_69

action_109 (119) = happyAccept
action_109 _ = happyFail

action_110 _ = happyReduce_70

action_111 (119) = happyAccept
action_111 _ = happyFail

action_112 (80) = happyShift action_163
action_112 _ = happyFail

action_113 (114) = happyShift action_34
action_113 (36) = happyGoto action_162
action_113 _ = happyFail

action_114 (115) = happyShift action_68
action_114 (37) = happyGoto action_161
action_114 _ = happyFail

action_115 (114) = happyShift action_34
action_115 (36) = happyGoto action_160
action_115 _ = happyFail

action_116 (86) = happyShift action_106
action_116 (114) = happyShift action_34
action_116 (36) = happyGoto action_104
action_116 (50) = happyGoto action_159
action_116 _ = happyFail

action_117 (114) = happyShift action_34
action_117 (36) = happyGoto action_130
action_117 (44) = happyGoto action_158
action_117 _ = happyFail

action_118 (74) = happyShift action_99
action_118 (86) = happyShift action_100
action_118 (88) = happyShift action_101
action_118 (114) = happyShift action_34
action_118 (36) = happyGoto action_97
action_118 (51) = happyGoto action_157
action_118 (52) = happyGoto action_103
action_118 _ = happyFail

action_119 (105) = happyShift action_155
action_119 (108) = happyShift action_156
action_119 (115) = happyShift action_68
action_119 (37) = happyGoto action_79
action_119 (61) = happyGoto action_154
action_119 _ = happyFail

action_120 (107) = happyShift action_153
action_120 _ = happyFail

action_121 (114) = happyShift action_34
action_121 (36) = happyGoto action_152
action_121 _ = happyFail

action_122 (101) = happyShift action_54
action_122 (69) = happyGoto action_151
action_122 _ = happyReduce_122

action_123 (101) = happyShift action_54
action_123 (69) = happyGoto action_150
action_123 _ = happyReduce_122

action_124 (114) = happyShift action_34
action_124 (36) = happyGoto action_149
action_124 _ = happyFail

action_125 (119) = happyAccept
action_125 _ = happyFail

action_126 (83) = happyShift action_148
action_126 _ = happyReduce_50

action_127 (74) = happyShift action_99
action_127 (83) = happyShift action_127
action_127 (86) = happyShift action_100
action_127 (88) = happyShift action_101
action_127 (90) = happyShift action_113
action_127 (91) = happyShift action_114
action_127 (92) = happyShift action_115
action_127 (93) = happyShift action_116
action_127 (95) = happyShift action_117
action_127 (97) = happyShift action_118
action_127 (98) = happyShift action_119
action_127 (102) = happyShift action_120
action_127 (103) = happyShift action_121
action_127 (104) = happyShift action_122
action_127 (106) = happyShift action_123
action_127 (107) = happyShift action_124
action_127 (114) = happyShift action_34
action_127 (36) = happyGoto action_97
action_127 (46) = happyGoto action_147
action_127 (47) = happyGoto action_126
action_127 (51) = happyGoto action_112
action_127 (52) = happyGoto action_103
action_127 _ = happyReduce_49

action_128 (119) = happyAccept
action_128 _ = happyFail

action_129 _ = happyReduce_48

action_130 (78) = happyShift action_146
action_130 _ = happyReduce_46

action_131 (119) = happyAccept
action_131 _ = happyFail

action_132 (78) = happyShift action_146
action_132 (81) = happyReduce_46
action_132 _ = happyReduce_79

action_133 (83) = happyShift action_145
action_133 _ = happyReduce_43

action_134 (119) = happyAccept
action_134 _ = happyFail

action_135 (81) = happyShift action_144
action_135 _ = happyFail

action_136 _ = happyReduce_39

action_137 (74) = happyShift action_99
action_137 (83) = happyShift action_137
action_137 (86) = happyShift action_100
action_137 (88) = happyShift action_101
action_137 (90) = happyShift action_113
action_137 (91) = happyShift action_114
action_137 (92) = happyShift action_115
action_137 (93) = happyShift action_116
action_137 (95) = happyShift action_117
action_137 (97) = happyShift action_118
action_137 (98) = happyShift action_119
action_137 (102) = happyShift action_120
action_137 (103) = happyShift action_121
action_137 (104) = happyShift action_122
action_137 (106) = happyShift action_123
action_137 (107) = happyShift action_124
action_137 (110) = happyShift action_138
action_137 (114) = happyShift action_34
action_137 (36) = happyGoto action_132
action_137 (42) = happyGoto action_133
action_137 (43) = happyGoto action_143
action_137 (44) = happyGoto action_135
action_137 (47) = happyGoto action_136
action_137 (51) = happyGoto action_112
action_137 (52) = happyGoto action_103
action_137 _ = happyReduce_42

action_138 (114) = happyShift action_34
action_138 (36) = happyGoto action_130
action_138 (44) = happyGoto action_142
action_138 _ = happyFail

action_139 (119) = happyAccept
action_139 _ = happyFail

action_140 (119) = happyAccept
action_140 _ = happyFail

action_141 _ = happyReduce_38

action_142 _ = happyReduce_41

action_143 _ = happyReduce_45

action_144 (74) = happyShift action_99
action_144 (86) = happyShift action_100
action_144 (88) = happyShift action_101
action_144 (90) = happyShift action_113
action_144 (91) = happyShift action_114
action_144 (92) = happyShift action_115
action_144 (93) = happyShift action_116
action_144 (95) = happyShift action_117
action_144 (97) = happyShift action_118
action_144 (98) = happyShift action_119
action_144 (102) = happyShift action_120
action_144 (103) = happyShift action_121
action_144 (104) = happyShift action_122
action_144 (106) = happyShift action_123
action_144 (107) = happyShift action_124
action_144 (114) = happyShift action_34
action_144 (36) = happyGoto action_97
action_144 (47) = happyGoto action_230
action_144 (51) = happyGoto action_112
action_144 (52) = happyGoto action_103
action_144 _ = happyFail

action_145 (74) = happyShift action_99
action_145 (83) = happyShift action_137
action_145 (86) = happyShift action_100
action_145 (88) = happyShift action_101
action_145 (90) = happyShift action_113
action_145 (91) = happyShift action_114
action_145 (92) = happyShift action_115
action_145 (93) = happyShift action_116
action_145 (95) = happyShift action_117
action_145 (97) = happyShift action_118
action_145 (98) = happyShift action_119
action_145 (102) = happyShift action_120
action_145 (103) = happyShift action_121
action_145 (104) = happyShift action_122
action_145 (106) = happyShift action_123
action_145 (107) = happyShift action_124
action_145 (110) = happyShift action_138
action_145 (114) = happyShift action_34
action_145 (36) = happyGoto action_132
action_145 (42) = happyGoto action_133
action_145 (43) = happyGoto action_229
action_145 (44) = happyGoto action_135
action_145 (47) = happyGoto action_136
action_145 (51) = happyGoto action_112
action_145 (52) = happyGoto action_103
action_145 _ = happyReduce_42

action_146 (114) = happyShift action_34
action_146 (36) = happyGoto action_130
action_146 (44) = happyGoto action_228
action_146 _ = happyFail

action_147 _ = happyReduce_52

action_148 (74) = happyShift action_99
action_148 (83) = happyShift action_127
action_148 (86) = happyShift action_100
action_148 (88) = happyShift action_101
action_148 (90) = happyShift action_113
action_148 (91) = happyShift action_114
action_148 (92) = happyShift action_115
action_148 (93) = happyShift action_116
action_148 (95) = happyShift action_117
action_148 (97) = happyShift action_118
action_148 (98) = happyShift action_119
action_148 (102) = happyShift action_120
action_148 (103) = happyShift action_121
action_148 (104) = happyShift action_122
action_148 (106) = happyShift action_123
action_148 (107) = happyShift action_124
action_148 (114) = happyShift action_34
action_148 (36) = happyGoto action_97
action_148 (46) = happyGoto action_227
action_148 (47) = happyGoto action_126
action_148 (51) = happyGoto action_112
action_148 (52) = happyGoto action_103
action_148 _ = happyReduce_49

action_149 (74) = happyShift action_40
action_149 (86) = happyShift action_41
action_149 (89) = happyShift action_42
action_149 (94) = happyShift action_43
action_149 (96) = happyShift action_44
action_149 (99) = happyShift action_45
action_149 (100) = happyShift action_46
action_149 (109) = happyShift action_47
action_149 (111) = happyShift action_48
action_149 (117) = happyShift action_49
action_149 (39) = happyGoto action_35
action_149 (70) = happyGoto action_36
action_149 (71) = happyGoto action_37
action_149 (72) = happyGoto action_38
action_149 (73) = happyGoto action_226
action_149 _ = happyFail

action_150 (86) = happyShift action_106
action_150 (114) = happyShift action_34
action_150 (36) = happyGoto action_104
action_150 (50) = happyGoto action_225
action_150 _ = happyFail

action_151 (86) = happyShift action_106
action_151 (114) = happyShift action_34
action_151 (36) = happyGoto action_104
action_151 (50) = happyGoto action_224
action_151 _ = happyFail

action_152 (82) = happyShift action_223
action_152 _ = happyFail

action_153 (114) = happyShift action_34
action_153 (36) = happyGoto action_222
action_153 _ = happyFail

action_154 _ = happyReduce_66

action_155 (115) = happyShift action_68
action_155 (37) = happyGoto action_79
action_155 (61) = happyGoto action_221
action_155 _ = happyFail

action_156 _ = happyReduce_68

action_157 (80) = happyShift action_220
action_157 _ = happyFail

action_158 _ = happyReduce_59

action_159 (115) = happyShift action_68
action_159 (37) = happyGoto action_219
action_159 _ = happyFail

action_160 (59) = happyGoto action_218
action_160 _ = happyReduce_95

action_161 (115) = happyShift action_68
action_161 (37) = happyGoto action_217
action_161 _ = happyReduce_54

action_162 (116) = happyShift action_69
action_162 (38) = happyGoto action_216
action_162 _ = happyFail

action_163 (86) = happyShift action_106
action_163 (114) = happyShift action_34
action_163 (36) = happyGoto action_104
action_163 (50) = happyGoto action_215
action_163 _ = happyFail

action_164 _ = happyReduce_72

action_165 (87) = happyShift action_214
action_165 _ = happyFail

action_166 (74) = happyShift action_89
action_166 (53) = happyGoto action_87
action_166 (57) = happyGoto action_213
action_166 _ = happyReduce_78

action_167 _ = happyReduce_76

action_168 (81) = happyShift action_170
action_168 (86) = happyShift action_174
action_168 _ = happyFail

action_169 _ = happyReduce_81

action_170 (75) = happyShift action_211
action_170 (86) = happyShift action_212
action_170 _ = happyFail

action_171 (116) = happyShift action_69
action_171 (38) = happyGoto action_93
action_171 (55) = happyGoto action_210
action_171 _ = happyReduce_86

action_172 (87) = happyShift action_209
action_172 _ = happyFail

action_173 (86) = happyShift action_92
action_173 (54) = happyGoto action_90
action_173 (56) = happyGoto action_208
action_173 _ = happyReduce_89

action_174 (86) = happyShift action_92
action_174 (54) = happyGoto action_90
action_174 (56) = happyGoto action_207
action_174 _ = happyReduce_89

action_175 _ = happyReduce_93

action_176 _ = happyReduce_96

action_177 _ = happyReduce_98

action_178 _ = happyReduce_99

action_179 (115) = happyShift action_68
action_179 (37) = happyGoto action_79
action_179 (61) = happyGoto action_206
action_179 _ = happyFail

action_180 (74) = happyShift action_66
action_180 (86) = happyShift action_67
action_180 (114) = happyShift action_34
action_180 (115) = happyShift action_68
action_180 (116) = happyShift action_69
action_180 (117) = happyShift action_49
action_180 (118) = happyShift action_70
action_180 (36) = happyGoto action_71
action_180 (37) = happyGoto action_60
action_180 (38) = happyGoto action_61
action_180 (39) = happyGoto action_62
action_180 (40) = happyGoto action_63
action_180 (62) = happyGoto action_205
action_180 (63) = happyGoto action_73
action_180 (64) = happyGoto action_74
action_180 _ = happyFail

action_181 (74) = happyShift action_66
action_181 (86) = happyShift action_67
action_181 (114) = happyShift action_34
action_181 (115) = happyShift action_68
action_181 (116) = happyShift action_69
action_181 (117) = happyShift action_49
action_181 (118) = happyShift action_70
action_181 (36) = happyGoto action_71
action_181 (37) = happyGoto action_60
action_181 (38) = happyGoto action_61
action_181 (39) = happyGoto action_62
action_181 (40) = happyGoto action_63
action_181 (62) = happyGoto action_72
action_181 (63) = happyGoto action_73
action_181 (64) = happyGoto action_74
action_181 (65) = happyGoto action_204
action_181 _ = happyReduce_113

action_182 _ = happyReduce_104

action_183 (87) = happyShift action_203
action_183 _ = happyFail

action_184 (75) = happyShift action_202
action_184 _ = happyFail

action_185 _ = happyReduce_117

action_186 (49) = happyGoto action_55
action_186 (67) = happyGoto action_56
action_186 (68) = happyGoto action_201
action_186 _ = happyReduce_71

action_187 (76) = happyShift action_189
action_187 (77) = happyShift action_190
action_187 (85) = happyShift action_191
action_187 _ = happyReduce_123

action_188 (74) = happyShift action_40
action_188 (86) = happyShift action_41
action_188 (89) = happyShift action_42
action_188 (94) = happyShift action_43
action_188 (96) = happyShift action_44
action_188 (99) = happyShift action_45
action_188 (100) = happyShift action_46
action_188 (109) = happyShift action_47
action_188 (111) = happyShift action_48
action_188 (117) = happyShift action_49
action_188 (39) = happyGoto action_35
action_188 (70) = happyGoto action_200
action_188 (72) = happyGoto action_38
action_188 _ = happyFail

action_189 _ = happyReduce_128

action_190 _ = happyReduce_129

action_191 _ = happyReduce_130

action_192 (113) = happyShift action_199
action_192 _ = happyFail

action_193 (87) = happyShift action_198
action_193 _ = happyFail

action_194 (75) = happyShift action_197
action_194 _ = happyFail

action_195 (74) = happyShift action_40
action_195 (86) = happyShift action_41
action_195 (89) = happyShift action_42
action_195 (94) = happyShift action_43
action_195 (96) = happyShift action_44
action_195 (99) = happyShift action_45
action_195 (100) = happyShift action_46
action_195 (109) = happyShift action_47
action_195 (111) = happyShift action_48
action_195 (117) = happyShift action_49
action_195 (39) = happyGoto action_35
action_195 (70) = happyGoto action_196
action_195 (72) = happyGoto action_38
action_195 _ = happyFail

action_196 (74) = happyShift action_40
action_196 (86) = happyShift action_41
action_196 (89) = happyShift action_42
action_196 (94) = happyShift action_43
action_196 (96) = happyShift action_44
action_196 (99) = happyShift action_45
action_196 (100) = happyShift action_46
action_196 (109) = happyShift action_47
action_196 (111) = happyShift action_48
action_196 (117) = happyShift action_49
action_196 (39) = happyGoto action_35
action_196 (72) = happyGoto action_187
action_196 _ = happyReduce_126

action_197 _ = happyReduce_140

action_198 _ = happyReduce_133

action_199 _ = happyReduce_134

action_200 (74) = happyShift action_40
action_200 (86) = happyShift action_41
action_200 (89) = happyShift action_42
action_200 (94) = happyShift action_43
action_200 (96) = happyShift action_44
action_200 (99) = happyShift action_45
action_200 (100) = happyShift action_46
action_200 (109) = happyShift action_47
action_200 (111) = happyShift action_48
action_200 (117) = happyShift action_49
action_200 (39) = happyGoto action_35
action_200 (72) = happyGoto action_187
action_200 _ = happyReduce_125

action_201 _ = happyReduce_120

action_202 _ = happyReduce_112

action_203 _ = happyReduce_111

action_204 _ = happyReduce_115

action_205 _ = happyReduce_102

action_206 _ = happyReduce_101

action_207 (87) = happyShift action_240
action_207 _ = happyFail

action_208 _ = happyReduce_91

action_209 _ = happyReduce_85

action_210 _ = happyReduce_88

action_211 _ = happyReduce_82

action_212 (87) = happyShift action_239
action_212 _ = happyFail

action_213 _ = happyReduce_77

action_214 _ = happyReduce_73

action_215 (82) = happyShift action_238
action_215 _ = happyFail

action_216 _ = happyReduce_63

action_217 _ = happyReduce_55

action_218 (84) = happyShift action_237
action_218 (114) = happyShift action_34
action_218 (36) = happyGoto action_85
action_218 (58) = happyGoto action_176
action_218 _ = happyFail

action_219 (115) = happyShift action_68
action_219 (37) = happyGoto action_236
action_219 _ = happyFail

action_220 (86) = happyShift action_106
action_220 (114) = happyShift action_34
action_220 (36) = happyGoto action_104
action_220 (50) = happyGoto action_235
action_220 _ = happyFail

action_221 _ = happyReduce_67

action_222 (74) = happyShift action_40
action_222 (86) = happyShift action_41
action_222 (89) = happyShift action_42
action_222 (94) = happyShift action_43
action_222 (96) = happyShift action_44
action_222 (99) = happyShift action_45
action_222 (100) = happyShift action_46
action_222 (109) = happyShift action_47
action_222 (111) = happyShift action_48
action_222 (117) = happyShift action_49
action_222 (39) = happyGoto action_35
action_222 (70) = happyGoto action_36
action_222 (71) = happyGoto action_37
action_222 (72) = happyGoto action_38
action_222 (73) = happyGoto action_234
action_222 _ = happyFail

action_223 (49) = happyGoto action_55
action_223 (67) = happyGoto action_56
action_223 (68) = happyGoto action_233
action_223 _ = happyReduce_71

action_224 (115) = happyShift action_68
action_224 (37) = happyGoto action_232
action_224 _ = happyFail

action_225 (115) = happyShift action_68
action_225 (37) = happyGoto action_231
action_225 _ = happyFail

action_226 _ = happyReduce_57

action_227 _ = happyReduce_51

action_228 _ = happyReduce_47

action_229 _ = happyReduce_44

action_230 _ = happyReduce_40

action_231 _ = happyReduce_61

action_232 _ = happyReduce_60

action_233 _ = happyReduce_64

action_234 _ = happyReduce_58

action_235 (82) = happyShift action_246
action_235 _ = happyFail

action_236 (104) = happyShift action_82
action_236 (106) = happyShift action_83
action_236 (60) = happyGoto action_245
action_236 _ = happyReduce_97

action_237 (74) = happyShift action_66
action_237 (86) = happyShift action_67
action_237 (114) = happyShift action_34
action_237 (115) = happyShift action_68
action_237 (116) = happyShift action_69
action_237 (117) = happyShift action_49
action_237 (118) = happyShift action_70
action_237 (36) = happyGoto action_71
action_237 (37) = happyGoto action_60
action_237 (38) = happyGoto action_61
action_237 (39) = happyGoto action_62
action_237 (40) = happyGoto action_63
action_237 (62) = happyGoto action_244
action_237 (63) = happyGoto action_73
action_237 (64) = happyGoto action_74
action_237 _ = happyFail

action_238 (49) = happyGoto action_243
action_238 _ = happyReduce_71

action_239 (75) = happyShift action_242
action_239 _ = happyFail

action_240 (78) = happyShift action_241
action_240 _ = happyFail

action_241 (86) = happyShift action_249
action_241 _ = happyFail

action_242 _ = happyReduce_83

action_243 (86) = happyShift action_106
action_243 (114) = happyShift action_34
action_243 (115) = happyShift action_68
action_243 (36) = happyGoto action_104
action_243 (37) = happyGoto action_108
action_243 (48) = happyGoto action_164
action_243 (50) = happyGoto action_110
action_243 _ = happyReduce_53

action_244 _ = happyReduce_65

action_245 (101) = happyShift action_54
action_245 (69) = happyGoto action_248
action_245 _ = happyReduce_122

action_246 (49) = happyGoto action_247
action_246 _ = happyReduce_71

action_247 (86) = happyShift action_106
action_247 (114) = happyShift action_34
action_247 (115) = happyShift action_68
action_247 (36) = happyGoto action_104
action_247 (37) = happyGoto action_108
action_247 (48) = happyGoto action_164
action_247 (50) = happyGoto action_110
action_247 _ = happyReduce_56

action_248 _ = happyReduce_62

action_249 (116) = happyShift action_69
action_249 (38) = happyGoto action_93
action_249 (55) = happyGoto action_250
action_249 _ = happyReduce_86

action_250 (87) = happyShift action_251
action_250 _ = happyFail

action_251 (75) = happyShift action_252
action_251 _ = happyFail

action_252 _ = happyReduce_84

happyReduce_33 = happySpecReduce_1  36 happyReduction_33
happyReduction_33 (HappyTerminal (PT _ (TV happy_var_1)))
	 =  HappyAbsSyn36
		 (Ident happy_var_1
	)
happyReduction_33 _  = notHappyAtAll 

happyReduce_34 = happySpecReduce_1  37 happyReduction_34
happyReduction_34 (HappyTerminal (PT _ (TL happy_var_1)))
	 =  HappyAbsSyn37
		 (happy_var_1
	)
happyReduction_34 _  = notHappyAtAll 

happyReduce_35 = happySpecReduce_1  38 happyReduction_35
happyReduction_35 (HappyTerminal (PT _ (TI happy_var_1)))
	 =  HappyAbsSyn38
		 ((read ( happy_var_1)) :: Integer
	)
happyReduction_35 _  = notHappyAtAll 

happyReduce_36 = happySpecReduce_1  39 happyReduction_36
happyReduction_36 (HappyTerminal (PT _ (TC happy_var_1)))
	 =  HappyAbsSyn39
		 ((read ( happy_var_1)) :: Char
	)
happyReduction_36 _  = notHappyAtAll 

happyReduce_37 = happySpecReduce_1  40 happyReduction_37
happyReduction_37 (HappyTerminal (PT _ (TD happy_var_1)))
	 =  HappyAbsSyn40
		 ((read ( happy_var_1)) :: Double
	)
happyReduction_37 _  = notHappyAtAll 

happyReduce_38 = happySpecReduce_1  41 happyReduction_38
happyReduction_38 (HappyAbsSyn43  happy_var_1)
	 =  HappyAbsSyn41
		 (AbsBNF.LGr happy_var_1
	)
happyReduction_38 _  = notHappyAtAll 

happyReduce_39 = happySpecReduce_1  42 happyReduction_39
happyReduction_39 (HappyAbsSyn47  happy_var_1)
	 =  HappyAbsSyn42
		 (AbsBNF.DefAll happy_var_1
	)
happyReduction_39 _  = notHappyAtAll 

happyReduce_40 = happySpecReduce_3  42 happyReduction_40
happyReduction_40 (HappyAbsSyn47  happy_var_3)
	_
	(HappyAbsSyn44  happy_var_1)
	 =  HappyAbsSyn42
		 (AbsBNF.DefSome happy_var_1 happy_var_3
	)
happyReduction_40 _ _ _  = notHappyAtAll 

happyReduce_41 = happySpecReduce_2  42 happyReduction_41
happyReduction_41 (HappyAbsSyn44  happy_var_2)
	_
	 =  HappyAbsSyn42
		 (AbsBNF.LDefView happy_var_2
	)
happyReduction_41 _ _  = notHappyAtAll 

happyReduce_42 = happySpecReduce_0  43 happyReduction_42
happyReduction_42  =  HappyAbsSyn43
		 ([]
	)

happyReduce_43 = happySpecReduce_1  43 happyReduction_43
happyReduction_43 (HappyAbsSyn42  happy_var_1)
	 =  HappyAbsSyn43
		 ((:[]) happy_var_1
	)
happyReduction_43 _  = notHappyAtAll 

happyReduce_44 = happySpecReduce_3  43 happyReduction_44
happyReduction_44 (HappyAbsSyn43  happy_var_3)
	_
	(HappyAbsSyn42  happy_var_1)
	 =  HappyAbsSyn43
		 ((:) happy_var_1 happy_var_3
	)
happyReduction_44 _ _ _  = notHappyAtAll 

happyReduce_45 = happySpecReduce_2  43 happyReduction_45
happyReduction_45 (HappyAbsSyn43  happy_var_2)
	_
	 =  HappyAbsSyn43
		 (happy_var_2
	)
happyReduction_45 _ _  = notHappyAtAll 

happyReduce_46 = happySpecReduce_1  44 happyReduction_46
happyReduction_46 (HappyAbsSyn36  happy_var_1)
	 =  HappyAbsSyn44
		 ((:[]) happy_var_1
	)
happyReduction_46 _  = notHappyAtAll 

happyReduce_47 = happySpecReduce_3  44 happyReduction_47
happyReduction_47 (HappyAbsSyn44  happy_var_3)
	_
	(HappyAbsSyn36  happy_var_1)
	 =  HappyAbsSyn44
		 ((:) happy_var_1 happy_var_3
	)
happyReduction_47 _ _ _  = notHappyAtAll 

happyReduce_48 = happySpecReduce_1  45 happyReduction_48
happyReduction_48 (HappyAbsSyn46  happy_var_1)
	 =  HappyAbsSyn45
		 (AbsBNF.Grammar happy_var_1
	)
happyReduction_48 _  = notHappyAtAll 

happyReduce_49 = happySpecReduce_0  46 happyReduction_49
happyReduction_49  =  HappyAbsSyn46
		 ([]
	)

happyReduce_50 = happySpecReduce_1  46 happyReduction_50
happyReduction_50 (HappyAbsSyn47  happy_var_1)
	 =  HappyAbsSyn46
		 ((:[]) happy_var_1
	)
happyReduction_50 _  = notHappyAtAll 

happyReduce_51 = happySpecReduce_3  46 happyReduction_51
happyReduction_51 (HappyAbsSyn46  happy_var_3)
	_
	(HappyAbsSyn47  happy_var_1)
	 =  HappyAbsSyn46
		 ((:) happy_var_1 happy_var_3
	)
happyReduction_51 _ _ _  = notHappyAtAll 

happyReduce_52 = happySpecReduce_2  46 happyReduction_52
happyReduction_52 (HappyAbsSyn46  happy_var_2)
	_
	 =  HappyAbsSyn46
		 (happy_var_2
	)
happyReduction_52 _ _  = notHappyAtAll 

happyReduce_53 = happyReduce 5 47 happyReduction_53
happyReduction_53 ((HappyAbsSyn49  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn50  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn51  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn47
		 (AbsBNF.Rule happy_var_1 happy_var_3 (reverse happy_var_5)
	) `HappyStk` happyRest

happyReduce_54 = happySpecReduce_2  47 happyReduction_54
happyReduction_54 (HappyAbsSyn37  happy_var_2)
	_
	 =  HappyAbsSyn47
		 (AbsBNF.Comment happy_var_2
	)
happyReduction_54 _ _  = notHappyAtAll 

happyReduce_55 = happySpecReduce_3  47 happyReduction_55
happyReduction_55 (HappyAbsSyn37  happy_var_3)
	(HappyAbsSyn37  happy_var_2)
	_
	 =  HappyAbsSyn47
		 (AbsBNF.Comments happy_var_2 happy_var_3
	)
happyReduction_55 _ _ _  = notHappyAtAll 

happyReduce_56 = happyReduce 6 47 happyReduction_56
happyReduction_56 ((HappyAbsSyn49  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn50  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn51  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn47
		 (AbsBNF.Internal happy_var_2 happy_var_4 (reverse happy_var_6)
	) `HappyStk` happyRest

happyReduce_57 = happySpecReduce_3  47 happyReduction_57
happyReduction_57 (HappyAbsSyn70  happy_var_3)
	(HappyAbsSyn36  happy_var_2)
	_
	 =  HappyAbsSyn47
		 (AbsBNF.Token happy_var_2 happy_var_3
	)
happyReduction_57 _ _ _  = notHappyAtAll 

happyReduce_58 = happyReduce 4 47 happyReduction_58
happyReduction_58 ((HappyAbsSyn70  happy_var_4) `HappyStk`
	(HappyAbsSyn36  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn47
		 (AbsBNF.PosToken happy_var_3 happy_var_4
	) `HappyStk` happyRest

happyReduce_59 = happySpecReduce_2  47 happyReduction_59
happyReduction_59 (HappyAbsSyn44  happy_var_2)
	_
	 =  HappyAbsSyn47
		 (AbsBNF.Entryp happy_var_2
	)
happyReduction_59 _ _  = notHappyAtAll 

happyReduce_60 = happyReduce 4 47 happyReduction_60
happyReduction_60 ((HappyAbsSyn37  happy_var_4) `HappyStk`
	(HappyAbsSyn50  happy_var_3) `HappyStk`
	(HappyAbsSyn69  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn47
		 (AbsBNF.Separator happy_var_2 happy_var_3 happy_var_4
	) `HappyStk` happyRest

happyReduce_61 = happyReduce 4 47 happyReduction_61
happyReduction_61 ((HappyAbsSyn37  happy_var_4) `HappyStk`
	(HappyAbsSyn50  happy_var_3) `HappyStk`
	(HappyAbsSyn69  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn47
		 (AbsBNF.Terminator happy_var_2 happy_var_3 happy_var_4
	) `HappyStk` happyRest

happyReduce_62 = happyReduce 6 47 happyReduction_62
happyReduction_62 ((HappyAbsSyn69  happy_var_6) `HappyStk`
	(HappyAbsSyn60  happy_var_5) `HappyStk`
	(HappyAbsSyn37  happy_var_4) `HappyStk`
	(HappyAbsSyn37  happy_var_3) `HappyStk`
	(HappyAbsSyn50  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn47
		 (AbsBNF.Delimiters happy_var_2 happy_var_3 happy_var_4 happy_var_5 happy_var_6
	) `HappyStk` happyRest

happyReduce_63 = happySpecReduce_3  47 happyReduction_63
happyReduction_63 (HappyAbsSyn38  happy_var_3)
	(HappyAbsSyn36  happy_var_2)
	_
	 =  HappyAbsSyn47
		 (AbsBNF.Coercions happy_var_2 happy_var_3
	)
happyReduction_63 _ _ _  = notHappyAtAll 

happyReduce_64 = happyReduce 4 47 happyReduction_64
happyReduction_64 ((HappyAbsSyn68  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn36  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn47
		 (AbsBNF.Rules happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_65 = happyReduce 5 47 happyReduction_65
happyReduction_65 ((HappyAbsSyn62  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn59  happy_var_3) `HappyStk`
	(HappyAbsSyn36  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn47
		 (AbsBNF.Function happy_var_2 (reverse happy_var_3) happy_var_5
	) `HappyStk` happyRest

happyReduce_66 = happySpecReduce_2  47 happyReduction_66
happyReduction_66 (HappyAbsSyn61  happy_var_2)
	_
	 =  HappyAbsSyn47
		 (AbsBNF.Layout happy_var_2
	)
happyReduction_66 _ _  = notHappyAtAll 

happyReduce_67 = happySpecReduce_3  47 happyReduction_67
happyReduction_67 (HappyAbsSyn61  happy_var_3)
	_
	_
	 =  HappyAbsSyn47
		 (AbsBNF.LayoutStop happy_var_3
	)
happyReduction_67 _ _ _  = notHappyAtAll 

happyReduce_68 = happySpecReduce_2  47 happyReduction_68
happyReduction_68 _
	_
	 =  HappyAbsSyn47
		 (AbsBNF.LayoutTop
	)

happyReduce_69 = happySpecReduce_1  48 happyReduction_69
happyReduction_69 (HappyAbsSyn37  happy_var_1)
	 =  HappyAbsSyn48
		 (AbsBNF.Terminal happy_var_1
	)
happyReduction_69 _  = notHappyAtAll 

happyReduce_70 = happySpecReduce_1  48 happyReduction_70
happyReduction_70 (HappyAbsSyn50  happy_var_1)
	 =  HappyAbsSyn48
		 (AbsBNF.NTerminal happy_var_1
	)
happyReduction_70 _  = notHappyAtAll 

happyReduce_71 = happySpecReduce_0  49 happyReduction_71
happyReduction_71  =  HappyAbsSyn49
		 ([]
	)

happyReduce_72 = happySpecReduce_2  49 happyReduction_72
happyReduction_72 (HappyAbsSyn48  happy_var_2)
	(HappyAbsSyn49  happy_var_1)
	 =  HappyAbsSyn49
		 (flip (:) happy_var_1 happy_var_2
	)
happyReduction_72 _ _  = notHappyAtAll 

happyReduce_73 = happySpecReduce_3  50 happyReduction_73
happyReduction_73 _
	(HappyAbsSyn50  happy_var_2)
	_
	 =  HappyAbsSyn50
		 (AbsBNF.ListCat happy_var_2
	)
happyReduction_73 _ _ _  = notHappyAtAll 

happyReduce_74 = happySpecReduce_1  50 happyReduction_74
happyReduction_74 (HappyAbsSyn36  happy_var_1)
	 =  HappyAbsSyn50
		 (AbsBNF.IdCat happy_var_1
	)
happyReduction_74 _  = notHappyAtAll 

happyReduce_75 = happySpecReduce_1  51 happyReduction_75
happyReduction_75 (HappyAbsSyn52  happy_var_1)
	 =  HappyAbsSyn51
		 (AbsBNF.LabNoP happy_var_1
	)
happyReduction_75 _  = notHappyAtAll 

happyReduce_76 = happySpecReduce_2  51 happyReduction_76
happyReduction_76 (HappyAbsSyn57  happy_var_2)
	(HappyAbsSyn52  happy_var_1)
	 =  HappyAbsSyn51
		 (AbsBNF.LabP happy_var_1 happy_var_2
	)
happyReduction_76 _ _  = notHappyAtAll 

happyReduce_77 = happySpecReduce_3  51 happyReduction_77
happyReduction_77 (HappyAbsSyn57  happy_var_3)
	(HappyAbsSyn52  happy_var_2)
	(HappyAbsSyn52  happy_var_1)
	 =  HappyAbsSyn51
		 (AbsBNF.LabPF happy_var_1 happy_var_2 happy_var_3
	)
happyReduction_77 _ _ _  = notHappyAtAll 

happyReduce_78 = happySpecReduce_2  51 happyReduction_78
happyReduction_78 (HappyAbsSyn52  happy_var_2)
	(HappyAbsSyn52  happy_var_1)
	 =  HappyAbsSyn51
		 (AbsBNF.LabF happy_var_1 happy_var_2
	)
happyReduction_78 _ _  = notHappyAtAll 

happyReduce_79 = happySpecReduce_1  52 happyReduction_79
happyReduction_79 (HappyAbsSyn36  happy_var_1)
	 =  HappyAbsSyn52
		 (AbsBNF.Id happy_var_1
	)
happyReduction_79 _  = notHappyAtAll 

happyReduce_80 = happySpecReduce_1  52 happyReduction_80
happyReduction_80 _
	 =  HappyAbsSyn52
		 (AbsBNF.Wild
	)

happyReduce_81 = happySpecReduce_2  52 happyReduction_81
happyReduction_81 _
	_
	 =  HappyAbsSyn52
		 (AbsBNF.ListE
	)

happyReduce_82 = happySpecReduce_3  52 happyReduction_82
happyReduction_82 _
	_
	_
	 =  HappyAbsSyn52
		 (AbsBNF.ListCons
	)

happyReduce_83 = happyReduce 5 52 happyReduction_83
happyReduction_83 (_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn52
		 (AbsBNF.ListOne
	) `HappyStk` happyRest

happyReduce_84 = happyReduce 9 53 happyReduction_84
happyReduction_84 (_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn55  happy_var_7) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn56  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn53
		 (AbsBNF.ProfIt happy_var_3 happy_var_7
	) `HappyStk` happyRest

happyReduce_85 = happySpecReduce_3  54 happyReduction_85
happyReduction_85 _
	(HappyAbsSyn55  happy_var_2)
	_
	 =  HappyAbsSyn54
		 (AbsBNF.Ints happy_var_2
	)
happyReduction_85 _ _ _  = notHappyAtAll 

happyReduce_86 = happySpecReduce_0  55 happyReduction_86
happyReduction_86  =  HappyAbsSyn55
		 ([]
	)

happyReduce_87 = happySpecReduce_1  55 happyReduction_87
happyReduction_87 (HappyAbsSyn38  happy_var_1)
	 =  HappyAbsSyn55
		 ((:[]) happy_var_1
	)
happyReduction_87 _  = notHappyAtAll 

happyReduce_88 = happySpecReduce_3  55 happyReduction_88
happyReduction_88 (HappyAbsSyn55  happy_var_3)
	_
	(HappyAbsSyn38  happy_var_1)
	 =  HappyAbsSyn55
		 ((:) happy_var_1 happy_var_3
	)
happyReduction_88 _ _ _  = notHappyAtAll 

happyReduce_89 = happySpecReduce_0  56 happyReduction_89
happyReduction_89  =  HappyAbsSyn56
		 ([]
	)

happyReduce_90 = happySpecReduce_1  56 happyReduction_90
happyReduction_90 (HappyAbsSyn54  happy_var_1)
	 =  HappyAbsSyn56
		 ((:[]) happy_var_1
	)
happyReduction_90 _  = notHappyAtAll 

happyReduce_91 = happySpecReduce_3  56 happyReduction_91
happyReduction_91 (HappyAbsSyn56  happy_var_3)
	_
	(HappyAbsSyn54  happy_var_1)
	 =  HappyAbsSyn56
		 ((:) happy_var_1 happy_var_3
	)
happyReduction_91 _ _ _  = notHappyAtAll 

happyReduce_92 = happySpecReduce_1  57 happyReduction_92
happyReduction_92 (HappyAbsSyn53  happy_var_1)
	 =  HappyAbsSyn57
		 ((:[]) happy_var_1
	)
happyReduction_92 _  = notHappyAtAll 

happyReduce_93 = happySpecReduce_2  57 happyReduction_93
happyReduction_93 (HappyAbsSyn57  happy_var_2)
	(HappyAbsSyn53  happy_var_1)
	 =  HappyAbsSyn57
		 ((:) happy_var_1 happy_var_2
	)
happyReduction_93 _ _  = notHappyAtAll 

happyReduce_94 = happySpecReduce_1  58 happyReduction_94
happyReduction_94 (HappyAbsSyn36  happy_var_1)
	 =  HappyAbsSyn58
		 (AbsBNF.Arg happy_var_1
	)
happyReduction_94 _  = notHappyAtAll 

happyReduce_95 = happySpecReduce_0  59 happyReduction_95
happyReduction_95  =  HappyAbsSyn59
		 ([]
	)

happyReduce_96 = happySpecReduce_2  59 happyReduction_96
happyReduction_96 (HappyAbsSyn58  happy_var_2)
	(HappyAbsSyn59  happy_var_1)
	 =  HappyAbsSyn59
		 (flip (:) happy_var_1 happy_var_2
	)
happyReduction_96 _ _  = notHappyAtAll 

happyReduce_97 = happySpecReduce_0  60 happyReduction_97
happyReduction_97  =  HappyAbsSyn60
		 (AbsBNF.SepNone
	)

happyReduce_98 = happySpecReduce_2  60 happyReduction_98
happyReduction_98 (HappyAbsSyn37  happy_var_2)
	_
	 =  HappyAbsSyn60
		 (AbsBNF.SepTerm happy_var_2
	)
happyReduction_98 _ _  = notHappyAtAll 

happyReduce_99 = happySpecReduce_2  60 happyReduction_99
happyReduction_99 (HappyAbsSyn37  happy_var_2)
	_
	 =  HappyAbsSyn60
		 (AbsBNF.SepSepar happy_var_2
	)
happyReduction_99 _ _  = notHappyAtAll 

happyReduce_100 = happySpecReduce_1  61 happyReduction_100
happyReduction_100 (HappyAbsSyn37  happy_var_1)
	 =  HappyAbsSyn61
		 ((:[]) happy_var_1
	)
happyReduction_100 _  = notHappyAtAll 

happyReduce_101 = happySpecReduce_3  61 happyReduction_101
happyReduction_101 (HappyAbsSyn61  happy_var_3)
	_
	(HappyAbsSyn37  happy_var_1)
	 =  HappyAbsSyn61
		 ((:) happy_var_1 happy_var_3
	)
happyReduction_101 _ _ _  = notHappyAtAll 

happyReduce_102 = happySpecReduce_3  62 happyReduction_102
happyReduction_102 (HappyAbsSyn62  happy_var_3)
	_
	(HappyAbsSyn62  happy_var_1)
	 =  HappyAbsSyn62
		 (AbsBNF.Cons happy_var_1 happy_var_3
	)
happyReduction_102 _ _ _  = notHappyAtAll 

happyReduce_103 = happySpecReduce_1  62 happyReduction_103
happyReduction_103 (HappyAbsSyn62  happy_var_1)
	 =  HappyAbsSyn62
		 (happy_var_1
	)
happyReduction_103 _  = notHappyAtAll 

happyReduce_104 = happySpecReduce_2  63 happyReduction_104
happyReduction_104 (HappyAbsSyn65  happy_var_2)
	(HappyAbsSyn36  happy_var_1)
	 =  HappyAbsSyn62
		 (AbsBNF.App happy_var_1 happy_var_2
	)
happyReduction_104 _ _  = notHappyAtAll 

happyReduce_105 = happySpecReduce_1  63 happyReduction_105
happyReduction_105 (HappyAbsSyn62  happy_var_1)
	 =  HappyAbsSyn62
		 (happy_var_1
	)
happyReduction_105 _  = notHappyAtAll 

happyReduce_106 = happySpecReduce_1  64 happyReduction_106
happyReduction_106 (HappyAbsSyn36  happy_var_1)
	 =  HappyAbsSyn62
		 (AbsBNF.Var happy_var_1
	)
happyReduction_106 _  = notHappyAtAll 

happyReduce_107 = happySpecReduce_1  64 happyReduction_107
happyReduction_107 (HappyAbsSyn38  happy_var_1)
	 =  HappyAbsSyn62
		 (AbsBNF.LitInt happy_var_1
	)
happyReduction_107 _  = notHappyAtAll 

happyReduce_108 = happySpecReduce_1  64 happyReduction_108
happyReduction_108 (HappyAbsSyn39  happy_var_1)
	 =  HappyAbsSyn62
		 (AbsBNF.LitChar happy_var_1
	)
happyReduction_108 _  = notHappyAtAll 

happyReduce_109 = happySpecReduce_1  64 happyReduction_109
happyReduction_109 (HappyAbsSyn37  happy_var_1)
	 =  HappyAbsSyn62
		 (AbsBNF.LitString happy_var_1
	)
happyReduction_109 _  = notHappyAtAll 

happyReduce_110 = happySpecReduce_1  64 happyReduction_110
happyReduction_110 (HappyAbsSyn40  happy_var_1)
	 =  HappyAbsSyn62
		 (AbsBNF.LitDouble happy_var_1
	)
happyReduction_110 _  = notHappyAtAll 

happyReduce_111 = happySpecReduce_3  64 happyReduction_111
happyReduction_111 _
	(HappyAbsSyn65  happy_var_2)
	_
	 =  HappyAbsSyn62
		 (AbsBNF.List happy_var_2
	)
happyReduction_111 _ _ _  = notHappyAtAll 

happyReduce_112 = happySpecReduce_3  64 happyReduction_112
happyReduction_112 _
	(HappyAbsSyn62  happy_var_2)
	_
	 =  HappyAbsSyn62
		 (happy_var_2
	)
happyReduction_112 _ _ _  = notHappyAtAll 

happyReduce_113 = happySpecReduce_0  65 happyReduction_113
happyReduction_113  =  HappyAbsSyn65
		 ([]
	)

happyReduce_114 = happySpecReduce_1  65 happyReduction_114
happyReduction_114 (HappyAbsSyn62  happy_var_1)
	 =  HappyAbsSyn65
		 ((:[]) happy_var_1
	)
happyReduction_114 _  = notHappyAtAll 

happyReduce_115 = happySpecReduce_3  65 happyReduction_115
happyReduction_115 (HappyAbsSyn65  happy_var_3)
	_
	(HappyAbsSyn62  happy_var_1)
	 =  HappyAbsSyn65
		 ((:) happy_var_1 happy_var_3
	)
happyReduction_115 _ _ _  = notHappyAtAll 

happyReduce_116 = happySpecReduce_1  66 happyReduction_116
happyReduction_116 (HappyAbsSyn62  happy_var_1)
	 =  HappyAbsSyn65
		 ((:[]) happy_var_1
	)
happyReduction_116 _  = notHappyAtAll 

happyReduce_117 = happySpecReduce_2  66 happyReduction_117
happyReduction_117 (HappyAbsSyn65  happy_var_2)
	(HappyAbsSyn62  happy_var_1)
	 =  HappyAbsSyn65
		 ((:) happy_var_1 happy_var_2
	)
happyReduction_117 _ _  = notHappyAtAll 

happyReduce_118 = happySpecReduce_1  67 happyReduction_118
happyReduction_118 (HappyAbsSyn49  happy_var_1)
	 =  HappyAbsSyn67
		 (AbsBNF.RHS (reverse happy_var_1)
	)
happyReduction_118 _  = notHappyAtAll 

happyReduce_119 = happySpecReduce_1  68 happyReduction_119
happyReduction_119 (HappyAbsSyn67  happy_var_1)
	 =  HappyAbsSyn68
		 ((:[]) happy_var_1
	)
happyReduction_119 _  = notHappyAtAll 

happyReduce_120 = happySpecReduce_3  68 happyReduction_120
happyReduction_120 (HappyAbsSyn68  happy_var_3)
	_
	(HappyAbsSyn67  happy_var_1)
	 =  HappyAbsSyn68
		 ((:) happy_var_1 happy_var_3
	)
happyReduction_120 _ _ _  = notHappyAtAll 

happyReduce_121 = happySpecReduce_1  69 happyReduction_121
happyReduction_121 _
	 =  HappyAbsSyn69
		 (AbsBNF.MNonempty
	)

happyReduce_122 = happySpecReduce_0  69 happyReduction_122
happyReduction_122  =  HappyAbsSyn69
		 (AbsBNF.MEmpty
	)

happyReduce_123 = happySpecReduce_2  70 happyReduction_123
happyReduction_123 (HappyAbsSyn70  happy_var_2)
	(HappyAbsSyn70  happy_var_1)
	 =  HappyAbsSyn70
		 (AbsBNF.RSeq happy_var_1 happy_var_2
	)
happyReduction_123 _ _  = notHappyAtAll 

happyReduce_124 = happySpecReduce_1  70 happyReduction_124
happyReduction_124 (HappyAbsSyn70  happy_var_1)
	 =  HappyAbsSyn70
		 (happy_var_1
	)
happyReduction_124 _  = notHappyAtAll 

happyReduce_125 = happySpecReduce_3  71 happyReduction_125
happyReduction_125 (HappyAbsSyn70  happy_var_3)
	_
	(HappyAbsSyn70  happy_var_1)
	 =  HappyAbsSyn70
		 (AbsBNF.RAlt happy_var_1 happy_var_3
	)
happyReduction_125 _ _ _  = notHappyAtAll 

happyReduce_126 = happySpecReduce_3  71 happyReduction_126
happyReduction_126 (HappyAbsSyn70  happy_var_3)
	_
	(HappyAbsSyn70  happy_var_1)
	 =  HappyAbsSyn70
		 (AbsBNF.RMinus happy_var_1 happy_var_3
	)
happyReduction_126 _ _ _  = notHappyAtAll 

happyReduce_127 = happySpecReduce_1  71 happyReduction_127
happyReduction_127 (HappyAbsSyn70  happy_var_1)
	 =  HappyAbsSyn70
		 (happy_var_1
	)
happyReduction_127 _  = notHappyAtAll 

happyReduce_128 = happySpecReduce_2  72 happyReduction_128
happyReduction_128 _
	(HappyAbsSyn70  happy_var_1)
	 =  HappyAbsSyn70
		 (AbsBNF.RStar happy_var_1
	)
happyReduction_128 _ _  = notHappyAtAll 

happyReduce_129 = happySpecReduce_2  72 happyReduction_129
happyReduction_129 _
	(HappyAbsSyn70  happy_var_1)
	 =  HappyAbsSyn70
		 (AbsBNF.RPlus happy_var_1
	)
happyReduction_129 _ _  = notHappyAtAll 

happyReduce_130 = happySpecReduce_2  72 happyReduction_130
happyReduction_130 _
	(HappyAbsSyn70  happy_var_1)
	 =  HappyAbsSyn70
		 (AbsBNF.ROpt happy_var_1
	)
happyReduction_130 _ _  = notHappyAtAll 

happyReduce_131 = happySpecReduce_1  72 happyReduction_131
happyReduction_131 _
	 =  HappyAbsSyn70
		 (AbsBNF.REps
	)

happyReduce_132 = happySpecReduce_1  72 happyReduction_132
happyReduction_132 (HappyAbsSyn39  happy_var_1)
	 =  HappyAbsSyn70
		 (AbsBNF.RChar happy_var_1
	)
happyReduction_132 _  = notHappyAtAll 

happyReduce_133 = happySpecReduce_3  72 happyReduction_133
happyReduction_133 _
	(HappyAbsSyn37  happy_var_2)
	_
	 =  HappyAbsSyn70
		 (AbsBNF.RAlts happy_var_2
	)
happyReduction_133 _ _ _  = notHappyAtAll 

happyReduce_134 = happySpecReduce_3  72 happyReduction_134
happyReduction_134 _
	(HappyAbsSyn37  happy_var_2)
	_
	 =  HappyAbsSyn70
		 (AbsBNF.RSeqs happy_var_2
	)
happyReduction_134 _ _ _  = notHappyAtAll 

happyReduce_135 = happySpecReduce_1  72 happyReduction_135
happyReduction_135 _
	 =  HappyAbsSyn70
		 (AbsBNF.RDigit
	)

happyReduce_136 = happySpecReduce_1  72 happyReduction_136
happyReduction_136 _
	 =  HappyAbsSyn70
		 (AbsBNF.RLetter
	)

happyReduce_137 = happySpecReduce_1  72 happyReduction_137
happyReduction_137 _
	 =  HappyAbsSyn70
		 (AbsBNF.RUpper
	)

happyReduce_138 = happySpecReduce_1  72 happyReduction_138
happyReduction_138 _
	 =  HappyAbsSyn70
		 (AbsBNF.RLower
	)

happyReduce_139 = happySpecReduce_1  72 happyReduction_139
happyReduction_139 _
	 =  HappyAbsSyn70
		 (AbsBNF.RAny
	)

happyReduce_140 = happySpecReduce_3  72 happyReduction_140
happyReduction_140 _
	(HappyAbsSyn70  happy_var_2)
	_
	 =  HappyAbsSyn70
		 (happy_var_2
	)
happyReduction_140 _ _ _  = notHappyAtAll 

happyReduce_141 = happySpecReduce_1  73 happyReduction_141
happyReduction_141 (HappyAbsSyn70  happy_var_1)
	 =  HappyAbsSyn70
		 (happy_var_1
	)
happyReduction_141 _  = notHappyAtAll 

happyNewToken action sts stk [] =
	action 119 119 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	PT _ (TS _ 1) -> cont 74;
	PT _ (TS _ 2) -> cont 75;
	PT _ (TS _ 3) -> cont 76;
	PT _ (TS _ 4) -> cont 77;
	PT _ (TS _ 5) -> cont 78;
	PT _ (TS _ 6) -> cont 79;
	PT _ (TS _ 7) -> cont 80;
	PT _ (TS _ 8) -> cont 81;
	PT _ (TS _ 9) -> cont 82;
	PT _ (TS _ 10) -> cont 83;
	PT _ (TS _ 11) -> cont 84;
	PT _ (TS _ 12) -> cont 85;
	PT _ (TS _ 13) -> cont 86;
	PT _ (TS _ 14) -> cont 87;
	PT _ (TS _ 15) -> cont 88;
	PT _ (TS _ 16) -> cont 89;
	PT _ (TS _ 17) -> cont 90;
	PT _ (TS _ 18) -> cont 91;
	PT _ (TS _ 19) -> cont 92;
	PT _ (TS _ 20) -> cont 93;
	PT _ (TS _ 21) -> cont 94;
	PT _ (TS _ 22) -> cont 95;
	PT _ (TS _ 23) -> cont 96;
	PT _ (TS _ 24) -> cont 97;
	PT _ (TS _ 25) -> cont 98;
	PT _ (TS _ 26) -> cont 99;
	PT _ (TS _ 27) -> cont 100;
	PT _ (TS _ 28) -> cont 101;
	PT _ (TS _ 29) -> cont 102;
	PT _ (TS _ 30) -> cont 103;
	PT _ (TS _ 31) -> cont 104;
	PT _ (TS _ 32) -> cont 105;
	PT _ (TS _ 33) -> cont 106;
	PT _ (TS _ 34) -> cont 107;
	PT _ (TS _ 35) -> cont 108;
	PT _ (TS _ 36) -> cont 109;
	PT _ (TS _ 37) -> cont 110;
	PT _ (TS _ 38) -> cont 111;
	PT _ (TS _ 39) -> cont 112;
	PT _ (TS _ 40) -> cont 113;
	PT _ (TV happy_dollar_dollar) -> cont 114;
	PT _ (TL happy_dollar_dollar) -> cont 115;
	PT _ (TI happy_dollar_dollar) -> cont 116;
	PT _ (TC happy_dollar_dollar) -> cont 117;
	PT _ (TD happy_dollar_dollar) -> cont 118;
	_ -> happyError' (tk:tks)
	}

happyError_ 119 tk tks = happyError' tks
happyError_ _ tk tks = happyError' (tk:tks)

happyThen :: () => Err a -> (a -> Err b) -> Err b
happyThen = (thenM)
happyReturn :: () => a -> Err a
happyReturn = (returnM)
happyThen1 m k tks = (thenM) m (\a -> k a tks)
happyReturn1 :: () => a -> b -> Err a
happyReturn1 = \a tks -> (returnM) a
happyError' :: () => [(Token)] -> Err a
happyError' = happyError

pLGrammar tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_0 tks) (\x -> case x of {HappyAbsSyn41 z -> happyReturn z; _other -> notHappyAtAll })

pLDef tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_1 tks) (\x -> case x of {HappyAbsSyn42 z -> happyReturn z; _other -> notHappyAtAll })

pListLDef tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_2 tks) (\x -> case x of {HappyAbsSyn43 z -> happyReturn z; _other -> notHappyAtAll })

pListIdent tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_3 tks) (\x -> case x of {HappyAbsSyn44 z -> happyReturn z; _other -> notHappyAtAll })

pGrammar tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_4 tks) (\x -> case x of {HappyAbsSyn45 z -> happyReturn z; _other -> notHappyAtAll })

pListDef tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_5 tks) (\x -> case x of {HappyAbsSyn46 z -> happyReturn z; _other -> notHappyAtAll })

pDef tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_6 tks) (\x -> case x of {HappyAbsSyn47 z -> happyReturn z; _other -> notHappyAtAll })

pItem tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_7 tks) (\x -> case x of {HappyAbsSyn48 z -> happyReturn z; _other -> notHappyAtAll })

pListItem tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_8 tks) (\x -> case x of {HappyAbsSyn49 z -> happyReturn z; _other -> notHappyAtAll })

pCat tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_9 tks) (\x -> case x of {HappyAbsSyn50 z -> happyReturn z; _other -> notHappyAtAll })

pLabel tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_10 tks) (\x -> case x of {HappyAbsSyn51 z -> happyReturn z; _other -> notHappyAtAll })

pLabelId tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_11 tks) (\x -> case x of {HappyAbsSyn52 z -> happyReturn z; _other -> notHappyAtAll })

pProfItem tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_12 tks) (\x -> case x of {HappyAbsSyn53 z -> happyReturn z; _other -> notHappyAtAll })

pIntList tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_13 tks) (\x -> case x of {HappyAbsSyn54 z -> happyReturn z; _other -> notHappyAtAll })

pListInteger tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_14 tks) (\x -> case x of {HappyAbsSyn55 z -> happyReturn z; _other -> notHappyAtAll })

pListIntList tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_15 tks) (\x -> case x of {HappyAbsSyn56 z -> happyReturn z; _other -> notHappyAtAll })

pListProfItem tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_16 tks) (\x -> case x of {HappyAbsSyn57 z -> happyReturn z; _other -> notHappyAtAll })

pArg tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_17 tks) (\x -> case x of {HappyAbsSyn58 z -> happyReturn z; _other -> notHappyAtAll })

pListArg tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_18 tks) (\x -> case x of {HappyAbsSyn59 z -> happyReturn z; _other -> notHappyAtAll })

pSeparation tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_19 tks) (\x -> case x of {HappyAbsSyn60 z -> happyReturn z; _other -> notHappyAtAll })

pListString tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_20 tks) (\x -> case x of {HappyAbsSyn61 z -> happyReturn z; _other -> notHappyAtAll })

pExp tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_21 tks) (\x -> case x of {HappyAbsSyn62 z -> happyReturn z; _other -> notHappyAtAll })

pExp1 tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_22 tks) (\x -> case x of {HappyAbsSyn62 z -> happyReturn z; _other -> notHappyAtAll })

pExp2 tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_23 tks) (\x -> case x of {HappyAbsSyn62 z -> happyReturn z; _other -> notHappyAtAll })

pListExp tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_24 tks) (\x -> case x of {HappyAbsSyn65 z -> happyReturn z; _other -> notHappyAtAll })

pListExp2 tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_25 tks) (\x -> case x of {HappyAbsSyn65 z -> happyReturn z; _other -> notHappyAtAll })

pRHS tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_26 tks) (\x -> case x of {HappyAbsSyn67 z -> happyReturn z; _other -> notHappyAtAll })

pListRHS tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_27 tks) (\x -> case x of {HappyAbsSyn68 z -> happyReturn z; _other -> notHappyAtAll })

pMinimumSize tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_28 tks) (\x -> case x of {HappyAbsSyn69 z -> happyReturn z; _other -> notHappyAtAll })

pReg2 tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_29 tks) (\x -> case x of {HappyAbsSyn70 z -> happyReturn z; _other -> notHappyAtAll })

pReg1 tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_30 tks) (\x -> case x of {HappyAbsSyn70 z -> happyReturn z; _other -> notHappyAtAll })

pReg3 tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_31 tks) (\x -> case x of {HappyAbsSyn70 z -> happyReturn z; _other -> notHappyAtAll })

pReg tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_32 tks) (\x -> case x of {HappyAbsSyn70 z -> happyReturn z; _other -> notHappyAtAll })

happySeq = happyDontSeq


returnM :: a -> Err a
returnM = return

thenM :: Err a -> (a -> Err b) -> Err b
thenM = (>>=)

happyError :: [Token] -> Err a
happyError ts =
  Bad $ "syntax error at " ++ tokenPos ts ++ 
  case ts of
    [] -> []
    [Err _] -> " due to lexer error"
    t:_ -> " before `" ++ id(prToken t) ++ "'"

myLexer = tokens
{-# LINE 1 "templates/GenericTemplate.hs" #-}
{-# LINE 1 "templates/GenericTemplate.hs" #-}
{-# LINE 1 "<built-in>" #-}
{-# LINE 1 "<command-line>" #-}







# 1 "/usr/include/stdc-predef.h" 1 3 4

# 17 "/usr/include/stdc-predef.h" 3 4











































{-# LINE 7 "<command-line>" #-}
{-# LINE 1 "templates/GenericTemplate.hs" #-}
-- Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp 

{-# LINE 13 "templates/GenericTemplate.hs" #-}

{-# LINE 46 "templates/GenericTemplate.hs" #-}








{-# LINE 67 "templates/GenericTemplate.hs" #-}

{-# LINE 77 "templates/GenericTemplate.hs" #-}

{-# LINE 86 "templates/GenericTemplate.hs" #-}

infixr 9 `HappyStk`
data HappyStk a = HappyStk a (HappyStk a)

-----------------------------------------------------------------------------
-- starting the parse

happyParse start_state = happyNewToken start_state notHappyAtAll notHappyAtAll

-----------------------------------------------------------------------------
-- Accepting the parse

-- If the current token is (1), it means we've just accepted a partial
-- parse (a %partial parser).  We must ignore the saved token on the top of
-- the stack in this case.
happyAccept (1) tk st sts (_ `HappyStk` ans `HappyStk` _) =
        happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) = 
         (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action

{-# LINE 155 "templates/GenericTemplate.hs" #-}

-----------------------------------------------------------------------------
-- HappyState data type (not arrays)



newtype HappyState b c = HappyState
        (Int ->                    -- token number
         Int ->                    -- token number (yes, again)
         b ->                           -- token semantic value
         HappyState b c ->              -- current state
         [HappyState b c] ->            -- state stack
         c)



-----------------------------------------------------------------------------
-- Shifting a token

happyShift new_state (1) tk st sts stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--     trace "shifting the error token" $
     new_state i i tk (HappyState (new_state)) ((st):(sts)) (stk)

happyShift new_state i tk st sts stk =
     happyNewToken new_state ((st):(sts)) ((HappyTerminal (tk))`HappyStk`stk)

-- happyReduce is specialised for the common cases.

happySpecReduce_0 i fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happySpecReduce_0 nt fn j tk st@((HappyState (action))) sts stk
     = action nt j tk st ((st):(sts)) (fn `HappyStk` stk)

happySpecReduce_1 i fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happySpecReduce_1 nt fn j tk _ sts@(((st@(HappyState (action))):(_))) (v1`HappyStk`stk')
     = let r = fn v1 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_2 i fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happySpecReduce_2 nt fn j tk _ ((_):(sts@(((st@(HappyState (action))):(_))))) (v1`HappyStk`v2`HappyStk`stk')
     = let r = fn v1 v2 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_3 i fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happySpecReduce_3 nt fn j tk _ ((_):(((_):(sts@(((st@(HappyState (action))):(_))))))) (v1`HappyStk`v2`HappyStk`v3`HappyStk`stk')
     = let r = fn v1 v2 v3 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happyReduce k i fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happyReduce k nt fn j tk st sts stk
     = case happyDrop (k - ((1) :: Int)) sts of
         sts1@(((st1@(HappyState (action))):(_))) ->
                let r = fn stk in  -- it doesn't hurt to always seq here...
                happyDoSeq r (action nt j tk st1 sts1 r)

happyMonadReduce k nt fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happyMonadReduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
          let drop_stk = happyDropStk k stk in
          happyThen1 (fn stk tk) (\r -> action nt j tk st1 sts1 (r `HappyStk` drop_stk))

happyMonad2Reduce k nt fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happyMonad2Reduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
         let drop_stk = happyDropStk k stk





             new_state = action

          in
          happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))

happyDrop (0) l = l
happyDrop n ((_):(t)) = happyDrop (n - ((1) :: Int)) t

happyDropStk (0) l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n - ((1)::Int)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction

{-# LINE 256 "templates/GenericTemplate.hs" #-}
happyGoto action j tk st = action j j tk (HappyState action)


-----------------------------------------------------------------------------
-- Error recovery ((1) is the error token)

-- parse error if we are in recovery and we fail again
happyFail (1) tk old_st _ stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--      trace "failing" $ 
        happyError_ i tk

{-  We don't need state discarding for our restricted implementation of
    "error".  In fact, it can cause some bogus parses, so I've disabled it
    for now --SDM

-- discard a state
happyFail  (1) tk old_st (((HappyState (action))):(sts)) 
                                                (saved_tok `HappyStk` _ `HappyStk` stk) =
--      trace ("discarding state, depth " ++ show (length stk))  $
        action (1) (1) tk (HappyState (action)) sts ((saved_tok`HappyStk`stk))
-}

-- Enter error recovery: generate an error token,
--                       save the old token and carry on.
happyFail  i tk (HappyState (action)) sts stk =
--      trace "entering error recovery" $
        action (1) (1) tk (HappyState (action)) sts ( (HappyErrorToken (i)) `HappyStk` stk)

-- Internal happy errors:

notHappyAtAll :: a
notHappyAtAll = error "Internal Happy error\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions







-----------------------------------------------------------------------------
-- Seq-ing.  If the --strict flag is given, then Happy emits 
--      happySeq = happyDoSeq
-- otherwise it emits
--      happySeq = happyDontSeq

happyDoSeq, happyDontSeq :: a -> b -> b
happyDoSeq   a b = a `seq` b
happyDontSeq a b = b

-----------------------------------------------------------------------------
-- Don't inline any functions from the template.  GHC has a nasty habit
-- of deciding to inline happyGoto everywhere, which increases the size of
-- the generated parser quite a bit.

{-# LINE 322 "templates/GenericTemplate.hs" #-}
{-# NOINLINE happyShift #-}
{-# NOINLINE happySpecReduce_0 #-}
{-# NOINLINE happySpecReduce_1 #-}
{-# NOINLINE happySpecReduce_2 #-}
{-# NOINLINE happySpecReduce_3 #-}
{-# NOINLINE happyReduce #-}
{-# NOINLINE happyMonadReduce #-}
{-# NOINLINE happyGoto #-}
{-# NOINLINE happyFail #-}

-- end of Happy Template.
