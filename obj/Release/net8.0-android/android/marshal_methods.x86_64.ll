; ModuleID = 'marshal_methods.x86_64.ll'
source_filename = "marshal_methods.x86_64.ll"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [130 x ptr] zeroinitializer, align 16

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [260 x i64] [
	i64 36418902923615093, ; 0: Plugin.LocalNotification => 0x8162cc9bdf1b75 => 50
	i64 98382396393917666, ; 1: Microsoft.Extensions.Primitives.dll => 0x15d8644ad360ce2 => 44
	i64 120698629574877762, ; 2: Mono.Android => 0x1accec39cafe242 => 129
	i64 131669012237370309, ; 3: Microsoft.Maui.Essentials.dll => 0x1d3c844de55c3c5 => 48
	i64 196720943101637631, ; 4: System.Linq.Expressions.dll => 0x2bae4a7cd73f3ff => 103
	i64 232391251801502327, ; 5: Xamarin.AndroidX.SavedState.dll => 0x3399e9cbc897277 => 78
	i64 233177144301842968, ; 6: Xamarin.AndroidX.Collection.Jvm.dll => 0x33c696097d9f218 => 60
	i64 435170709725415398, ; 7: Xamarin.GooglePlayServices.Location => 0x60a097471d687e6 => 86
	i64 545109961164950392, ; 8: fi/Microsoft.Maui.Controls.resources.dll => 0x7909e9f1ec38b78 => 7
	i64 592295183581559413, ; 9: Xamarin.AndroidX.Lifecycle.Common.Jvm => 0x8384154d38dba75 => 68
	i64 687654259221141486, ; 10: Xamarin.GooglePlayServices.Base => 0x98b09e7c92917ee => 84
	i64 750875890346172408, ; 11: System.Threading.Thread => 0xa6ba5a4da7d1ff8 => 121
	i64 799765834175365804, ; 12: System.ComponentModel.dll => 0xb1956c9f18442ac => 97
	i64 849051935479314978, ; 13: hi/Microsoft.Maui.Controls.resources.dll => 0xbc8703ca21a3a22 => 10
	i64 870603111519317375, ; 14: SQLitePCLRaw.lib.e_sqlite3.android => 0xc1500ead2756d7f => 54
	i64 872800313462103108, ; 15: Xamarin.AndroidX.DrawerLayout => 0xc1ccf42c3c21c44 => 65
	i64 1120440138749646132, ; 16: Xamarin.Google.Android.Material.dll => 0xf8c9a5eae431534 => 83
	i64 1121665720830085036, ; 17: nb/Microsoft.Maui.Controls.resources.dll => 0xf90f507becf47ac => 18
	i64 1301485588176585670, ; 18: SQLitePCLRaw.core => 0x120fce3f338e43c6 => 53
	i64 1369545283391376210, ; 19: Xamarin.AndroidX.Navigation.Fragment.dll => 0x13019a2dd85acb52 => 74
	i64 1476839205573959279, ; 20: System.Net.Primitives.dll => 0x147ec96ece9b1e6f => 107
	i64 1486715745332614827, ; 21: Microsoft.Maui.Controls.dll => 0x14a1e017ea87d6ab => 45
	i64 1513467482682125403, ; 22: Mono.Android.Runtime => 0x1500eaa8245f6c5b => 128
	i64 1518315023656898250, ; 23: SQLitePCLRaw.provider.e_sqlite3 => 0x151223783a354eca => 55
	i64 1537168428375924959, ; 24: System.Threading.Thread.dll => 0x15551e8a954ae0df => 121
	i64 1556147632182429976, ; 25: ko/Microsoft.Maui.Controls.resources.dll => 0x15988c06d24c8918 => 16
	i64 1624659445732251991, ; 26: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0x168bf32877da9957 => 58
	i64 1628611045998245443, ; 27: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0x1699fd1e1a00b643 => 71
	i64 1743969030606105336, ; 28: System.Memory.dll => 0x1833d297e88f2af8 => 105
	i64 1767386781656293639, ; 29: System.Private.Uri.dll => 0x188704e9f5582107 => 111
	i64 1795316252682057001, ; 30: Xamarin.AndroidX.AppCompat.dll => 0x18ea3e9eac997529 => 57
	i64 1825687700144851180, ; 31: System.Runtime.InteropServices.RuntimeInformation.dll => 0x1956254a55ef08ec => 113
	i64 1835311033149317475, ; 32: es\Microsoft.Maui.Controls.resources => 0x197855a927386163 => 6
	i64 1836611346387731153, ; 33: Xamarin.AndroidX.SavedState => 0x197cf449ebe482d1 => 78
	i64 1881198190668717030, ; 34: tr\Microsoft.Maui.Controls.resources => 0x1a1b5bc992ea9be6 => 28
	i64 1920760634179481754, ; 35: Microsoft.Maui.Controls.Xaml => 0x1aa7e99ec2d2709a => 46
	i64 1959996714666907089, ; 36: tr/Microsoft.Maui.Controls.resources.dll => 0x1b334ea0a2a755d1 => 28
	i64 1983698669889758782, ; 37: cs/Microsoft.Maui.Controls.resources.dll => 0x1b87836e2031a63e => 2
	i64 2019660174692588140, ; 38: pl/Microsoft.Maui.Controls.resources.dll => 0x1c07463a6f8e1a6c => 20
	i64 2262844636196693701, ; 39: Xamarin.AndroidX.DrawerLayout.dll => 0x1f673d352266e6c5 => 65
	i64 2287834202362508563, ; 40: System.Collections.Concurrent => 0x1fc00515e8ce7513 => 91
	i64 2302323944321350744, ; 41: ru/Microsoft.Maui.Controls.resources.dll => 0x1ff37f6ddb267c58 => 24
	i64 2329709569556905518, ; 42: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x2054ca829b447e2e => 69
	i64 2335503487726329082, ; 43: System.Text.Encodings.Web => 0x2069600c4d9d1cfa => 118
	i64 2470498323731680442, ; 44: Xamarin.AndroidX.CoordinatorLayout => 0x2248f922dc398cba => 61
	i64 2497223385847772520, ; 45: System.Runtime => 0x22a7eb7046413568 => 116
	i64 2547086958574651984, ; 46: Xamarin.AndroidX.Activity.dll => 0x2359121801df4a50 => 56
	i64 2602673633151553063, ; 47: th\Microsoft.Maui.Controls.resources => 0x241e8de13a460e27 => 27
	i64 2656907746661064104, ; 48: Microsoft.Extensions.DependencyInjection => 0x24df3b84c8b75da8 => 39
	i64 2662981627730767622, ; 49: cs\Microsoft.Maui.Controls.resources => 0x24f4cfae6c48af06 => 2
	i64 2895129759130297543, ; 50: fi\Microsoft.Maui.Controls.resources => 0x282d912d479fa4c7 => 7
	i64 3017704767998173186, ; 51: Xamarin.Google.Android.Material => 0x29e10a7f7d88a002 => 83
	i64 3289520064315143713, ; 52: Xamarin.AndroidX.Lifecycle.Common => 0x2da6b911e3063621 => 67
	i64 3311221304742556517, ; 53: System.Numerics.Vectors.dll => 0x2df3d23ba9e2b365 => 109
	i64 3344514922410554693, ; 54: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x2e6a1a9a18463545 => 89
	i64 3411255996856937470, ; 55: Xamarin.GooglePlayServices.Basement => 0x2f5737416a942bfe => 85
	i64 3429672777697402584, ; 56: Microsoft.Maui.Essentials => 0x2f98a5385a7b1ed8 => 48
	i64 3494946837667399002, ; 57: Microsoft.Extensions.Configuration => 0x30808ba1c00a455a => 37
	i64 3522470458906976663, ; 58: Xamarin.AndroidX.SwipeRefreshLayout => 0x30e2543832f52197 => 79
	i64 3551103847008531295, ; 59: System.Private.CoreLib.dll => 0x31480e226177735f => 126
	i64 3567343442040498961, ; 60: pt\Microsoft.Maui.Controls.resources => 0x3181bff5bea4ab11 => 22
	i64 3571415421602489686, ; 61: System.Runtime.dll => 0x319037675df7e556 => 116
	i64 3638003163729360188, ; 62: Microsoft.Extensions.Configuration.Abstractions => 0x327cc89a39d5f53c => 38
	i64 3647754201059316852, ; 63: System.Xml.ReaderWriter => 0x329f6d1e86145474 => 123
	i64 3655542548057982301, ; 64: Microsoft.Extensions.Configuration.dll => 0x32bb18945e52855d => 37
	i64 3716579019761409177, ; 65: netstandard.dll => 0x3393f0ed5c8c5c99 => 125
	i64 3727469159507183293, ; 66: Xamarin.AndroidX.RecyclerView => 0x33baa1739ba646bd => 77
	i64 3819418959926008421, ; 67: CapstoneMobileApp.dll => 0x35014d4ed2c81a65 => 90
	i64 3869221888984012293, ; 68: Microsoft.Extensions.Logging.dll => 0x35b23cceda0ed605 => 41
	i64 3890352374528606784, ; 69: Microsoft.Maui.Controls.Xaml.dll => 0x35fd4edf66e00240 => 46
	i64 3933965368022646939, ; 70: System.Net.Requests => 0x369840a8bfadc09b => 108
	i64 3966267475168208030, ; 71: System.Memory => 0x370b03412596249e => 105
	i64 4073500526318903918, ; 72: System.Private.Xml.dll => 0x3887fb25779ae26e => 112
	i64 4120493066591692148, ; 73: zh-Hant\Microsoft.Maui.Controls.resources => 0x392eee9cdda86574 => 33
	i64 4154383907710350974, ; 74: System.ComponentModel => 0x39a7562737acb67e => 97
	i64 4187479170553454871, ; 75: System.Linq.Expressions => 0x3a1cea1e912fa117 => 103
	i64 4205801962323029395, ; 76: System.ComponentModel.TypeConverter => 0x3a5e0299f7e7ad93 => 96
	i64 4247996603072512073, ; 77: Xamarin.GooglePlayServices.Tasks => 0x3af3ea6755340049 => 87
	i64 4337444564132831293, ; 78: SQLitePCLRaw.batteries_v2.dll => 0x3c31b2d9ae16203d => 52
	i64 4356591372459378815, ; 79: vi/Microsoft.Maui.Controls.resources.dll => 0x3c75b8c562f9087f => 30
	i64 4636684751163556186, ; 80: Xamarin.AndroidX.VersionedParcelable.dll => 0x4058d0370893015a => 80
	i64 4679594760078841447, ; 81: ar/Microsoft.Maui.Controls.resources.dll => 0x40f142a407475667 => 0
	i64 4794310189461587505, ; 82: Xamarin.AndroidX.Activity => 0x4288cfb749e4c631 => 56
	i64 4795410492532947900, ; 83: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0x428cb86f8f9b7bbc => 79
	i64 4853321196694829351, ; 84: System.Runtime.Loader.dll => 0x435a75ea15de7927 => 115
	i64 5290786973231294105, ; 85: System.Runtime.Loader => 0x496ca6b869b72699 => 115
	i64 5423376490970181369, ; 86: System.Runtime.InteropServices.RuntimeInformation => 0x4b43b42f2b7b6ef9 => 113
	i64 5471532531798518949, ; 87: sv\Microsoft.Maui.Controls.resources => 0x4beec9d926d82ca5 => 26
	i64 5522859530602327440, ; 88: uk\Microsoft.Maui.Controls.resources => 0x4ca5237b51eead90 => 29
	i64 5528247634813456972, ; 89: Plugin.LocalNotification.dll => 0x4cb847ef1773124c => 50
	i64 5570799893513421663, ; 90: System.IO.Compression.Brotli => 0x4d4f74fcdfa6c35f => 101
	i64 5573260873512690141, ; 91: System.Security.Cryptography.dll => 0x4d58333c6e4ea1dd => 117
	i64 5692067934154308417, ; 92: Xamarin.AndroidX.ViewPager2.dll => 0x4efe49a0d4a8bb41 => 82
	i64 6068057819846744445, ; 93: ro/Microsoft.Maui.Controls.resources.dll => 0x5436126fec7f197d => 23
	i64 6183170893902868313, ; 94: SQLitePCLRaw.batteries_v2 => 0x55cf092b0c9d6f59 => 52
	i64 6200764641006662125, ; 95: ro\Microsoft.Maui.Controls.resources => 0x560d8a96830131ed => 23
	i64 6222399776351216807, ; 96: System.Text.Json.dll => 0x565a67a0ffe264a7 => 119
	i64 6357457916754632952, ; 97: _Microsoft.Android.Resource.Designer => 0x583a3a4ac2a7a0f8 => 34
	i64 6401687960814735282, ; 98: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0x58d75d486341cfb2 => 69
	i64 6478287442656530074, ; 99: hr\Microsoft.Maui.Controls.resources => 0x59e7801b0c6a8e9a => 11
	i64 6548213210057960872, ; 100: Xamarin.AndroidX.CustomView.dll => 0x5adfed387b066da8 => 64
	i64 6560151584539558821, ; 101: Microsoft.Extensions.Options => 0x5b0a571be53243a5 => 43
	i64 6743165466166707109, ; 102: nl\Microsoft.Maui.Controls.resources => 0x5d948943c08c43a5 => 19
	i64 6777482997383978746, ; 103: pt/Microsoft.Maui.Controls.resources.dll => 0x5e0e74e0a2525efa => 22
	i64 6786606130239981554, ; 104: System.Diagnostics.TraceSource => 0x5e2ede51877147f2 => 100
	i64 6894844156784520562, ; 105: System.Numerics.Vectors => 0x5faf683aead1ad72 => 109
	i64 7220009545223068405, ; 106: sv/Microsoft.Maui.Controls.resources.dll => 0x6432a06d99f35af5 => 26
	i64 7270811800166795866, ; 107: System.Linq => 0x64e71ccf51a90a5a => 104
	i64 7377312882064240630, ; 108: System.ComponentModel.TypeConverter.dll => 0x66617afac45a2ff6 => 96
	i64 7489048572193775167, ; 109: System.ObjectModel => 0x67ee71ff6b419e3f => 110
	i64 7654504624184590948, ; 110: System.Net.Http => 0x6a3a4366801b8264 => 106
	i64 7708790323521193081, ; 111: ms/Microsoft.Maui.Controls.resources.dll => 0x6afb1ff4d1730479 => 17
	i64 7714652370974252055, ; 112: System.Private.CoreLib => 0x6b0ff375198b9c17 => 126
	i64 7735352534559001595, ; 113: Xamarin.Kotlin.StdLib.dll => 0x6b597e2582ce8bfb => 88
	i64 7836164640616011524, ; 114: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x6cbfa6390d64d704 => 58
	i64 8064050204834738623, ; 115: System.Collections.dll => 0x6fe942efa61731bf => 94
	i64 8083354569033831015, ; 116: Xamarin.AndroidX.Lifecycle.Common.dll => 0x702dd82730cad267 => 67
	i64 8087206902342787202, ; 117: System.Diagnostics.DiagnosticSource => 0x703b87d46f3aa082 => 99
	i64 8167236081217502503, ; 118: Java.Interop.dll => 0x7157d9f1a9b8fd27 => 127
	i64 8185542183669246576, ; 119: System.Collections => 0x7198e33f4794aa70 => 94
	i64 8246048515196606205, ; 120: Microsoft.Maui.Graphics.dll => 0x726fd96f64ee56fd => 49
	i64 8368701292315763008, ; 121: System.Security.Cryptography => 0x7423997c6fd56140 => 117
	i64 8400357532724379117, ; 122: Xamarin.AndroidX.Navigation.UI.dll => 0x749410ab44503ded => 76
	i64 8518412311883997971, ; 123: System.Collections.Immutable => 0x76377add7c28e313 => 92
	i64 8563666267364444763, ; 124: System.Private.Uri => 0x76d841191140ca5b => 111
	i64 8599632406834268464, ; 125: CommunityToolkit.Maui => 0x7758081c784b4930 => 35
	i64 8614108721271900878, ; 126: pt-BR/Microsoft.Maui.Controls.resources.dll => 0x778b763e14018ace => 21
	i64 8626175481042262068, ; 127: Java.Interop => 0x77b654e585b55834 => 127
	i64 8639588376636138208, ; 128: Xamarin.AndroidX.Navigation.Runtime => 0x77e5fbdaa2fda2e0 => 75
	i64 8677882282824630478, ; 129: pt-BR\Microsoft.Maui.Controls.resources => 0x786e07f5766b00ce => 21
	i64 8725526185868997716, ; 130: System.Diagnostics.DiagnosticSource.dll => 0x79174bd613173454 => 99
	i64 9045785047181495996, ; 131: zh-HK\Microsoft.Maui.Controls.resources => 0x7d891592e3cb0ebc => 31
	i64 9312692141327339315, ; 132: Xamarin.AndroidX.ViewPager2 => 0x813d54296a634f33 => 82
	i64 9324707631942237306, ; 133: Xamarin.AndroidX.AppCompat => 0x8168042fd44a7c7a => 57
	i64 9659729154652888475, ; 134: System.Text.RegularExpressions => 0x860e407c9991dd9b => 120
	i64 9678050649315576968, ; 135: Xamarin.AndroidX.CoordinatorLayout.dll => 0x864f57c9feb18c88 => 61
	i64 9702891218465930390, ; 136: System.Collections.NonGeneric.dll => 0x86a79827b2eb3c96 => 93
	i64 9808709177481450983, ; 137: Mono.Android.dll => 0x881f890734e555e7 => 129
	i64 9875200773399460291, ; 138: Xamarin.GooglePlayServices.Base.dll => 0x890bc2c8482339c3 => 84
	i64 9956195530459977388, ; 139: Microsoft.Maui => 0x8a2b8315b36616ac => 47
	i64 9991543690424095600, ; 140: es/Microsoft.Maui.Controls.resources.dll => 0x8aa9180c89861370 => 6
	i64 10005203495335603334, ; 141: CapstoneMobileApp => 0x8ad99f91b4f9ac86 => 90
	i64 10038780035334861115, ; 142: System.Net.Http.dll => 0x8b50e941206af13b => 106
	i64 10051358222726253779, ; 143: System.Private.Xml => 0x8b7d990c97ccccd3 => 112
	i64 10092835686693276772, ; 144: Microsoft.Maui.Controls => 0x8c10f49539bd0c64 => 45
	i64 10143853363526200146, ; 145: da\Microsoft.Maui.Controls.resources => 0x8cc634e3c2a16b52 => 3
	i64 10229024438826829339, ; 146: Xamarin.AndroidX.CustomView => 0x8df4cb880b10061b => 64
	i64 10406448008575299332, ; 147: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x906b2153fcb3af04 => 89
	i64 10430153318873392755, ; 148: Xamarin.AndroidX.Core => 0x90bf592ea44f6673 => 62
	i64 10506226065143327199, ; 149: ca\Microsoft.Maui.Controls.resources => 0x91cd9cf11ed169df => 1
	i64 10785150219063592792, ; 150: System.Net.Primitives => 0x95ac8cfb68830758 => 107
	i64 10880838204485145808, ; 151: CommunityToolkit.Maui.dll => 0x970080b2a4d614d0 => 35
	i64 11002576679268595294, ; 152: Microsoft.Extensions.Logging.Abstractions => 0x98b1013215cd365e => 42
	i64 11009005086950030778, ; 153: Microsoft.Maui.dll => 0x98c7d7cc621ffdba => 47
	i64 11103970607964515343, ; 154: hu\Microsoft.Maui.Controls.resources => 0x9a193a6fc41a6c0f => 12
	i64 11162124722117608902, ; 155: Xamarin.AndroidX.ViewPager => 0x9ae7d54b986d05c6 => 81
	i64 11220793807500858938, ; 156: ja\Microsoft.Maui.Controls.resources => 0x9bb8448481fdd63a => 15
	i64 11226290749488709958, ; 157: Microsoft.Extensions.Options.dll => 0x9bcbcbf50c874146 => 43
	i64 11299661109949763898, ; 158: Xamarin.AndroidX.Collection.Jvm => 0x9cd075e94cda113a => 60
	i64 11340910727871153756, ; 159: Xamarin.AndroidX.CursorAdapter => 0x9d630238642d465c => 63
	i64 11485890710487134646, ; 160: System.Runtime.InteropServices => 0x9f6614bf0f8b71b6 => 114
	i64 11518296021396496455, ; 161: id\Microsoft.Maui.Controls.resources => 0x9fd9353475222047 => 13
	i64 11529969570048099689, ; 162: Xamarin.AndroidX.ViewPager.dll => 0xa002ae3c4dc7c569 => 81
	i64 11530571088791430846, ; 163: Microsoft.Extensions.Logging => 0xa004d1504ccd66be => 41
	i64 11597940890313164233, ; 164: netstandard => 0xa0f429ca8d1805c9 => 125
	i64 11675352430687308415, ; 165: Xamarin.AndroidX.Lifecycle.Common.Jvm.dll => 0xa2072f2d529c4a7f => 68
	i64 11705530742807338875, ; 166: he/Microsoft.Maui.Controls.resources.dll => 0xa272663128721f7b => 9
	i64 11739066727115742305, ; 167: SQLite-net.dll => 0xa2e98afdf8575c61 => 51
	i64 11806260347154423189, ; 168: SQLite-net => 0xa3d8433bc5eb5d95 => 51
	i64 12145679461940342714, ; 169: System.Text.Json => 0xa88e1f1ebcb62fba => 119
	i64 12269460666702402136, ; 170: System.Collections.Immutable.dll => 0xaa45e178506c9258 => 92
	i64 12279246230491828964, ; 171: SQLitePCLRaw.provider.e_sqlite3.dll => 0xaa68a5636e0512e4 => 55
	i64 12341818387765915815, ; 172: CommunityToolkit.Maui.Core.dll => 0xab46f26f152bf0a7 => 36
	i64 12451044538927396471, ; 173: Xamarin.AndroidX.Fragment.dll => 0xaccaff0a2955b677 => 66
	i64 12466513435562512481, ; 174: Xamarin.AndroidX.Loader.dll => 0xad01f3eb52569061 => 72
	i64 12475113361194491050, ; 175: _Microsoft.Android.Resource.Designer.dll => 0xad2081818aba1caa => 34
	i64 12517810545449516888, ; 176: System.Diagnostics.TraceSource.dll => 0xadb8325e6f283f58 => 100
	i64 12538491095302438457, ; 177: Xamarin.AndroidX.CardView.dll => 0xae01ab382ae67e39 => 59
	i64 12550732019250633519, ; 178: System.IO.Compression => 0xae2d28465e8e1b2f => 102
	i64 12681088699309157496, ; 179: it/Microsoft.Maui.Controls.resources.dll => 0xaffc46fc178aec78 => 14
	i64 12823819093633476069, ; 180: th/Microsoft.Maui.Controls.resources.dll => 0xb1f75b85abe525e5 => 27
	i64 12843321153144804894, ; 181: Microsoft.Extensions.Primitives => 0xb23ca48abd74d61e => 44
	i64 13221551921002590604, ; 182: ca/Microsoft.Maui.Controls.resources.dll => 0xb77c636bdebe318c => 1
	i64 13222659110913276082, ; 183: ja/Microsoft.Maui.Controls.resources.dll => 0xb78052679c1178b2 => 15
	i64 13343850469010654401, ; 184: Mono.Android.Runtime.dll => 0xb92ee14d854f44c1 => 128
	i64 13381594904270902445, ; 185: he\Microsoft.Maui.Controls.resources => 0xb9b4f9aaad3e94ad => 9
	i64 13465488254036897740, ; 186: Xamarin.Kotlin.StdLib => 0xbadf06394d106fcc => 88
	i64 13467053111158216594, ; 187: uk/Microsoft.Maui.Controls.resources.dll => 0xbae49573fde79792 => 29
	i64 13540124433173649601, ; 188: vi\Microsoft.Maui.Controls.resources => 0xbbe82f6eede718c1 => 30
	i64 13545416393490209236, ; 189: id/Microsoft.Maui.Controls.resources.dll => 0xbbfafc7174bc99d4 => 13
	i64 13572454107664307259, ; 190: Xamarin.AndroidX.RecyclerView.dll => 0xbc5b0b19d99f543b => 77
	i64 13717397318615465333, ; 191: System.ComponentModel.Primitives.dll => 0xbe5dfc2ef2f87d75 => 95
	i64 13755568601956062840, ; 192: fr/Microsoft.Maui.Controls.resources.dll => 0xbee598c36b1b9678 => 8
	i64 13814445057219246765, ; 193: hr/Microsoft.Maui.Controls.resources.dll => 0xbfb6c49664b43aad => 11
	i64 13881769479078963060, ; 194: System.Console.dll => 0xc0a5f3cade5c6774 => 98
	i64 13959074834287824816, ; 195: Xamarin.AndroidX.Fragment => 0xc1b8989a7ad20fb0 => 66
	i64 14100563506285742564, ; 196: da/Microsoft.Maui.Controls.resources.dll => 0xc3af43cd0cff89e4 => 3
	i64 14124974489674258913, ; 197: Xamarin.AndroidX.CardView => 0xc405fd76067d19e1 => 59
	i64 14125464355221830302, ; 198: System.Threading.dll => 0xc407bafdbc707a9e => 122
	i64 14461014870687870182, ; 199: System.Net.Requests.dll => 0xc8afd8683afdece6 => 108
	i64 14464374589798375073, ; 200: ru\Microsoft.Maui.Controls.resources => 0xc8bbc80dcb1e5ea1 => 24
	i64 14522721392235705434, ; 201: el/Microsoft.Maui.Controls.resources.dll => 0xc98b12295c2cf45a => 5
	i64 14551742072151931844, ; 202: System.Text.Encodings.Web.dll => 0xc9f22c50f1b8fbc4 => 118
	i64 14556034074661724008, ; 203: CommunityToolkit.Maui.Core => 0xca016bdea6b19f68 => 36
	i64 14669215534098758659, ; 204: Microsoft.Extensions.DependencyInjection.dll => 0xcb9385ceb3993c03 => 39
	i64 14678510994762383812, ; 205: Xamarin.GooglePlayServices.Location.dll => 0xcbb48bfaca7a41c4 => 86
	i64 14705122255218365489, ; 206: ko\Microsoft.Maui.Controls.resources => 0xcc1316c7b0fb5431 => 16
	i64 14744092281598614090, ; 207: zh-Hans\Microsoft.Maui.Controls.resources => 0xcc9d89d004439a4a => 32
	i64 14795403873026468413, ; 208: Xamarin.AndroidX.Lifecycle.ViewModel.Android => 0xcd53d56ee02e6a3d => 70
	i64 14852515768018889994, ; 209: Xamarin.AndroidX.CursorAdapter.dll => 0xce1ebc6625a76d0a => 63
	i64 14892012299694389861, ; 210: zh-Hant/Microsoft.Maui.Controls.resources.dll => 0xceab0e490a083a65 => 33
	i64 14904040806490515477, ; 211: ar\Microsoft.Maui.Controls.resources => 0xced5ca2604cb2815 => 0
	i64 14954917835170835695, ; 212: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xcf8a8a895a82ecef => 40
	i64 14987728460634540364, ; 213: System.IO.Compression.dll => 0xcfff1ba06622494c => 102
	i64 15076659072870671916, ; 214: System.ObjectModel.dll => 0xd13b0d8c1620662c => 110
	i64 15111608613780139878, ; 215: ms\Microsoft.Maui.Controls.resources => 0xd1b737f831192f66 => 17
	i64 15115185479366240210, ; 216: System.IO.Compression.Brotli.dll => 0xd1c3ed1c1bc467d2 => 101
	i64 15133485256822086103, ; 217: System.Linq.dll => 0xd204f0a9127dd9d7 => 104
	i64 15227001540531775957, ; 218: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd3512d3999b8e9d5 => 38
	i64 15255283452148687628, ; 219: Xamarin.AndroidX.Lifecycle.ViewModel.Android.dll => 0xd3b5a7794937a30c => 70
	i64 15370334346939861994, ; 220: Xamarin.AndroidX.Core.dll => 0xd54e65a72c560bea => 62
	i64 15391712275433856905, ; 221: Microsoft.Extensions.DependencyInjection.Abstractions => 0xd59a58c406411f89 => 40
	i64 15527772828719725935, ; 222: System.Console => 0xd77dbb1e38cd3d6f => 98
	i64 15536481058354060254, ; 223: de\Microsoft.Maui.Controls.resources => 0xd79cab34eec75bde => 4
	i64 15582737692548360875, ; 224: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xd841015ed86f6aab => 71
	i64 15609085926864131306, ; 225: System.dll => 0xd89e9cf3334914ea => 124
	i64 15661133872274321916, ; 226: System.Xml.ReaderWriter.dll => 0xd9578647d4bfb1fc => 123
	i64 15664356999916475676, ; 227: de/Microsoft.Maui.Controls.resources.dll => 0xd962f9b2b6ecd51c => 4
	i64 15743187114543869802, ; 228: hu/Microsoft.Maui.Controls.resources.dll => 0xda7b09450ae4ef6a => 12
	i64 15783653065526199428, ; 229: el\Microsoft.Maui.Controls.resources => 0xdb0accd674b1c484 => 5
	i64 15930129725311349754, ; 230: Xamarin.GooglePlayServices.Tasks.dll => 0xdd1330956f12f3fa => 87
	i64 16154507427712707110, ; 231: System => 0xe03056ea4e39aa26 => 124
	i64 16288847719894691167, ; 232: nb\Microsoft.Maui.Controls.resources => 0xe20d9cb300c12d5f => 18
	i64 16321164108206115771, ; 233: Microsoft.Extensions.Logging.Abstractions.dll => 0xe2806c487e7b0bbb => 42
	i64 16649148416072044166, ; 234: Microsoft.Maui.Graphics => 0xe70da84600bb4e86 => 49
	i64 16677317093839702854, ; 235: Xamarin.AndroidX.Navigation.UI => 0xe771bb8960dd8b46 => 76
	i64 16755018182064898362, ; 236: SQLitePCLRaw.core.dll => 0xe885c843c330813a => 53
	i64 16890310621557459193, ; 237: System.Text.RegularExpressions.dll => 0xea66700587f088f9 => 120
	i64 16942731696432749159, ; 238: sk\Microsoft.Maui.Controls.resources => 0xeb20acb622a01a67 => 25
	i64 16998075588627545693, ; 239: Xamarin.AndroidX.Navigation.Fragment => 0xebe54bb02d623e5d => 74
	i64 17008137082415910100, ; 240: System.Collections.NonGeneric => 0xec090a90408c8cd4 => 93
	i64 17031351772568316411, ; 241: Xamarin.AndroidX.Navigation.Common.dll => 0xec5b843380a769fb => 73
	i64 17062143951396181894, ; 242: System.ComponentModel.Primitives => 0xecc8e986518c9786 => 95
	i64 17089008752050867324, ; 243: zh-Hans/Microsoft.Maui.Controls.resources.dll => 0xed285aeb25888c7c => 32
	i64 17342750010158924305, ; 244: hi\Microsoft.Maui.Controls.resources => 0xf0add33f97ecc211 => 10
	i64 17438153253682247751, ; 245: sk/Microsoft.Maui.Controls.resources.dll => 0xf200c3fe308d7847 => 25
	i64 17514990004910432069, ; 246: fr\Microsoft.Maui.Controls.resources => 0xf311be9c6f341f45 => 8
	i64 17623389608345532001, ; 247: pl\Microsoft.Maui.Controls.resources => 0xf492db79dfbef661 => 20
	i64 17702523067201099846, ; 248: zh-HK/Microsoft.Maui.Controls.resources.dll => 0xf5abfef008ae1846 => 31
	i64 17704177640604968747, ; 249: Xamarin.AndroidX.Loader => 0xf5b1dfc36cac272b => 72
	i64 17712670374920797664, ; 250: System.Runtime.InteropServices.dll => 0xf5d00bdc38bd3de0 => 114
	i64 17986907704309214542, ; 251: Xamarin.GooglePlayServices.Basement.dll => 0xf99e554223166d4e => 85
	i64 18025913125965088385, ; 252: System.Threading => 0xfa28e87b91334681 => 122
	i64 18099568558057551825, ; 253: nl/Microsoft.Maui.Controls.resources.dll => 0xfb2e95b53ad977d1 => 19
	i64 18121036031235206392, ; 254: Xamarin.AndroidX.Navigation.Common => 0xfb7ada42d3d42cf8 => 73
	i64 18245806341561545090, ; 255: System.Collections.Concurrent.dll => 0xfd3620327d587182 => 91
	i64 18305135509493619199, ; 256: Xamarin.AndroidX.Navigation.Runtime.dll => 0xfe08e7c2d8c199ff => 75
	i64 18324163916253801303, ; 257: it\Microsoft.Maui.Controls.resources => 0xfe4c81ff0a56ab57 => 14
	i64 18370042311372477656, ; 258: SQLitePCLRaw.lib.e_sqlite3.android.dll => 0xfeef80274e4094d8 => 54
	i64 18380184030268848184 ; 259: Xamarin.AndroidX.VersionedParcelable => 0xff1387fe3e7b7838 => 80
], align 16

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [260 x i32] [
	i32 50, ; 0
	i32 44, ; 1
	i32 129, ; 2
	i32 48, ; 3
	i32 103, ; 4
	i32 78, ; 5
	i32 60, ; 6
	i32 86, ; 7
	i32 7, ; 8
	i32 68, ; 9
	i32 84, ; 10
	i32 121, ; 11
	i32 97, ; 12
	i32 10, ; 13
	i32 54, ; 14
	i32 65, ; 15
	i32 83, ; 16
	i32 18, ; 17
	i32 53, ; 18
	i32 74, ; 19
	i32 107, ; 20
	i32 45, ; 21
	i32 128, ; 22
	i32 55, ; 23
	i32 121, ; 24
	i32 16, ; 25
	i32 58, ; 26
	i32 71, ; 27
	i32 105, ; 28
	i32 111, ; 29
	i32 57, ; 30
	i32 113, ; 31
	i32 6, ; 32
	i32 78, ; 33
	i32 28, ; 34
	i32 46, ; 35
	i32 28, ; 36
	i32 2, ; 37
	i32 20, ; 38
	i32 65, ; 39
	i32 91, ; 40
	i32 24, ; 41
	i32 69, ; 42
	i32 118, ; 43
	i32 61, ; 44
	i32 116, ; 45
	i32 56, ; 46
	i32 27, ; 47
	i32 39, ; 48
	i32 2, ; 49
	i32 7, ; 50
	i32 83, ; 51
	i32 67, ; 52
	i32 109, ; 53
	i32 89, ; 54
	i32 85, ; 55
	i32 48, ; 56
	i32 37, ; 57
	i32 79, ; 58
	i32 126, ; 59
	i32 22, ; 60
	i32 116, ; 61
	i32 38, ; 62
	i32 123, ; 63
	i32 37, ; 64
	i32 125, ; 65
	i32 77, ; 66
	i32 90, ; 67
	i32 41, ; 68
	i32 46, ; 69
	i32 108, ; 70
	i32 105, ; 71
	i32 112, ; 72
	i32 33, ; 73
	i32 97, ; 74
	i32 103, ; 75
	i32 96, ; 76
	i32 87, ; 77
	i32 52, ; 78
	i32 30, ; 79
	i32 80, ; 80
	i32 0, ; 81
	i32 56, ; 82
	i32 79, ; 83
	i32 115, ; 84
	i32 115, ; 85
	i32 113, ; 86
	i32 26, ; 87
	i32 29, ; 88
	i32 50, ; 89
	i32 101, ; 90
	i32 117, ; 91
	i32 82, ; 92
	i32 23, ; 93
	i32 52, ; 94
	i32 23, ; 95
	i32 119, ; 96
	i32 34, ; 97
	i32 69, ; 98
	i32 11, ; 99
	i32 64, ; 100
	i32 43, ; 101
	i32 19, ; 102
	i32 22, ; 103
	i32 100, ; 104
	i32 109, ; 105
	i32 26, ; 106
	i32 104, ; 107
	i32 96, ; 108
	i32 110, ; 109
	i32 106, ; 110
	i32 17, ; 111
	i32 126, ; 112
	i32 88, ; 113
	i32 58, ; 114
	i32 94, ; 115
	i32 67, ; 116
	i32 99, ; 117
	i32 127, ; 118
	i32 94, ; 119
	i32 49, ; 120
	i32 117, ; 121
	i32 76, ; 122
	i32 92, ; 123
	i32 111, ; 124
	i32 35, ; 125
	i32 21, ; 126
	i32 127, ; 127
	i32 75, ; 128
	i32 21, ; 129
	i32 99, ; 130
	i32 31, ; 131
	i32 82, ; 132
	i32 57, ; 133
	i32 120, ; 134
	i32 61, ; 135
	i32 93, ; 136
	i32 129, ; 137
	i32 84, ; 138
	i32 47, ; 139
	i32 6, ; 140
	i32 90, ; 141
	i32 106, ; 142
	i32 112, ; 143
	i32 45, ; 144
	i32 3, ; 145
	i32 64, ; 146
	i32 89, ; 147
	i32 62, ; 148
	i32 1, ; 149
	i32 107, ; 150
	i32 35, ; 151
	i32 42, ; 152
	i32 47, ; 153
	i32 12, ; 154
	i32 81, ; 155
	i32 15, ; 156
	i32 43, ; 157
	i32 60, ; 158
	i32 63, ; 159
	i32 114, ; 160
	i32 13, ; 161
	i32 81, ; 162
	i32 41, ; 163
	i32 125, ; 164
	i32 68, ; 165
	i32 9, ; 166
	i32 51, ; 167
	i32 51, ; 168
	i32 119, ; 169
	i32 92, ; 170
	i32 55, ; 171
	i32 36, ; 172
	i32 66, ; 173
	i32 72, ; 174
	i32 34, ; 175
	i32 100, ; 176
	i32 59, ; 177
	i32 102, ; 178
	i32 14, ; 179
	i32 27, ; 180
	i32 44, ; 181
	i32 1, ; 182
	i32 15, ; 183
	i32 128, ; 184
	i32 9, ; 185
	i32 88, ; 186
	i32 29, ; 187
	i32 30, ; 188
	i32 13, ; 189
	i32 77, ; 190
	i32 95, ; 191
	i32 8, ; 192
	i32 11, ; 193
	i32 98, ; 194
	i32 66, ; 195
	i32 3, ; 196
	i32 59, ; 197
	i32 122, ; 198
	i32 108, ; 199
	i32 24, ; 200
	i32 5, ; 201
	i32 118, ; 202
	i32 36, ; 203
	i32 39, ; 204
	i32 86, ; 205
	i32 16, ; 206
	i32 32, ; 207
	i32 70, ; 208
	i32 63, ; 209
	i32 33, ; 210
	i32 0, ; 211
	i32 40, ; 212
	i32 102, ; 213
	i32 110, ; 214
	i32 17, ; 215
	i32 101, ; 216
	i32 104, ; 217
	i32 38, ; 218
	i32 70, ; 219
	i32 62, ; 220
	i32 40, ; 221
	i32 98, ; 222
	i32 4, ; 223
	i32 71, ; 224
	i32 124, ; 225
	i32 123, ; 226
	i32 4, ; 227
	i32 12, ; 228
	i32 5, ; 229
	i32 87, ; 230
	i32 124, ; 231
	i32 18, ; 232
	i32 42, ; 233
	i32 49, ; 234
	i32 76, ; 235
	i32 53, ; 236
	i32 120, ; 237
	i32 25, ; 238
	i32 74, ; 239
	i32 93, ; 240
	i32 73, ; 241
	i32 95, ; 242
	i32 32, ; 243
	i32 10, ; 244
	i32 25, ; 245
	i32 8, ; 246
	i32 20, ; 247
	i32 31, ; 248
	i32 72, ; 249
	i32 114, ; 250
	i32 85, ; 251
	i32 122, ; 252
	i32 19, ; 253
	i32 73, ; 254
	i32 91, ; 255
	i32 75, ; 256
	i32 14, ; 257
	i32 54, ; 258
	i32 80 ; 259
], align 16

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 8

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 8

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 0, ; id 0x0; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 8

; Functions

; Function attributes: "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" uwtable willreturn
define void @xamarin_app_init(ptr nocapture noundef readnone %env, ptr noundef %fn) local_unnamed_addr #0
{
	%fnIsNull = icmp eq ptr %fn, null
	br i1 %fnIsNull, label %1, label %2

1: ; preds = %0
	%putsResult = call noundef i32 @puts(ptr @.str.0)
	call void @abort()
	unreachable 

2: ; preds = %1, %0
	store ptr %fn, ptr @get_function_pointer, align 8, !tbaa !3
	ret void
}

; Strings
@.str.0 = private unnamed_addr constant [40 x i8] c"get_function_pointer MUST be specified\0A\00", align 16

;MarshalMethodName
@.MarshalMethodName.0_name = private unnamed_addr constant [1 x i8] c"\00", align 1

; External functions

; Function attributes: noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+crc32,+cx16,+cx8,+fxsr,+mmx,+popcnt,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+ssse3,+x87" "tune-cpu"="generic" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+crc32,+cx16,+cx8,+fxsr,+mmx,+popcnt,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+ssse3,+x87" "tune-cpu"="generic" }

; Metadata
!llvm.module.flags = !{!0, !1}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.4xx @ df9aaf29a52042a4fbf800daf2f3a38964b9e958"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
