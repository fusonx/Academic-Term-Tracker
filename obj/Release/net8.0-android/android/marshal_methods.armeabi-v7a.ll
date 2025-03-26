; ModuleID = 'marshal_methods.armeabi-v7a.ll'
source_filename = "marshal_methods.armeabi-v7a.ll"
target datalayout = "e-m:e-p:32:32-Fi8-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "armv7-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [130 x ptr] zeroinitializer, align 4

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [260 x i32] [
	i32 42639949, ; 0: System.Threading.Thread => 0x28aa24d => 121
	i32 67008169, ; 1: zh-Hant\Microsoft.Maui.Controls.resources => 0x3fe76a9 => 33
	i32 72070932, ; 2: Microsoft.Maui.Graphics.dll => 0x44bb714 => 49
	i32 117431740, ; 3: System.Runtime.InteropServices => 0x6ffddbc => 114
	i32 182336117, ; 4: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0xade3a75 => 79
	i32 195452805, ; 5: vi/Microsoft.Maui.Controls.resources.dll => 0xba65f85 => 30
	i32 199333315, ; 6: zh-HK/Microsoft.Maui.Controls.resources.dll => 0xbe195c3 => 31
	i32 205061960, ; 7: System.ComponentModel => 0xc38ff48 => 97
	i32 280992041, ; 8: cs/Microsoft.Maui.Controls.resources.dll => 0x10bf9929 => 2
	i32 317674968, ; 9: vi\Microsoft.Maui.Controls.resources => 0x12ef55d8 => 30
	i32 318968648, ; 10: Xamarin.AndroidX.Activity.dll => 0x13031348 => 56
	i32 336156722, ; 11: ja/Microsoft.Maui.Controls.resources.dll => 0x14095832 => 15
	i32 342366114, ; 12: Xamarin.AndroidX.Lifecycle.Common => 0x146817a2 => 67
	i32 347068432, ; 13: SQLitePCLRaw.lib.e_sqlite3.android.dll => 0x14afd810 => 54
	i32 356389973, ; 14: it/Microsoft.Maui.Controls.resources.dll => 0x153e1455 => 14
	i32 379916513, ; 15: System.Threading.Thread.dll => 0x16a510e1 => 121
	i32 385762202, ; 16: System.Memory.dll => 0x16fe439a => 105
	i32 395744057, ; 17: _Microsoft.Android.Resource.Designer => 0x17969339 => 34
	i32 435591531, ; 18: sv/Microsoft.Maui.Controls.resources.dll => 0x19f6996b => 26
	i32 442565967, ; 19: System.Collections => 0x1a61054f => 94
	i32 450948140, ; 20: Xamarin.AndroidX.Fragment.dll => 0x1ae0ec2c => 66
	i32 469710990, ; 21: System.dll => 0x1bff388e => 124
	i32 498788369, ; 22: System.ObjectModel => 0x1dbae811 => 110
	i32 500358224, ; 23: id/Microsoft.Maui.Controls.resources.dll => 0x1dd2dc50 => 13
	i32 503918385, ; 24: fi/Microsoft.Maui.Controls.resources.dll => 0x1e092f31 => 7
	i32 504143952, ; 25: Plugin.LocalNotification.dll => 0x1e0ca050 => 50
	i32 513247710, ; 26: Microsoft.Extensions.Primitives.dll => 0x1e9789de => 44
	i32 539058512, ; 27: Microsoft.Extensions.Logging => 0x20216150 => 41
	i32 592146354, ; 28: pt-BR/Microsoft.Maui.Controls.resources.dll => 0x234b6fb2 => 21
	i32 597488923, ; 29: CommunityToolkit.Maui => 0x239cf51b => 35
	i32 627609679, ; 30: Xamarin.AndroidX.CustomView => 0x2568904f => 64
	i32 627931235, ; 31: nl\Microsoft.Maui.Controls.resources => 0x256d7863 => 19
	i32 662205335, ; 32: System.Text.Encodings.Web.dll => 0x27787397 => 118
	i32 663517072, ; 33: Xamarin.AndroidX.VersionedParcelable => 0x278c7790 => 80
	i32 672442732, ; 34: System.Collections.Concurrent => 0x2814a96c => 91
	i32 688181140, ; 35: ca/Microsoft.Maui.Controls.resources.dll => 0x2904cf94 => 1
	i32 706645707, ; 36: ko/Microsoft.Maui.Controls.resources.dll => 0x2a1e8ecb => 16
	i32 709557578, ; 37: de/Microsoft.Maui.Controls.resources.dll => 0x2a4afd4a => 4
	i32 722857257, ; 38: System.Runtime.Loader.dll => 0x2b15ed29 => 115
	i32 748832960, ; 39: SQLitePCLRaw.batteries_v2 => 0x2ca248c0 => 52
	i32 759454413, ; 40: System.Net.Requests => 0x2d445acd => 108
	i32 775507847, ; 41: System.IO.Compression => 0x2e394f87 => 102
	i32 777317022, ; 42: sk\Microsoft.Maui.Controls.resources => 0x2e54ea9e => 25
	i32 789151979, ; 43: Microsoft.Extensions.Options => 0x2f0980eb => 43
	i32 823281589, ; 44: System.Private.Uri.dll => 0x311247b5 => 111
	i32 830298997, ; 45: System.IO.Compression.Brotli => 0x317d5b75 => 101
	i32 904024072, ; 46: System.ComponentModel.Primitives.dll => 0x35e25008 => 95
	i32 926902833, ; 47: tr/Microsoft.Maui.Controls.resources.dll => 0x373f6a31 => 28
	i32 967690846, ; 48: Xamarin.AndroidX.Lifecycle.Common.dll => 0x39adca5e => 67
	i32 992768348, ; 49: System.Collections.dll => 0x3b2c715c => 94
	i32 1012816738, ; 50: Xamarin.AndroidX.SavedState.dll => 0x3c5e5b62 => 78
	i32 1028951442, ; 51: Microsoft.Extensions.DependencyInjection.Abstractions => 0x3d548d92 => 40
	i32 1029334545, ; 52: da/Microsoft.Maui.Controls.resources.dll => 0x3d5a6611 => 3
	i32 1035644815, ; 53: Xamarin.AndroidX.AppCompat => 0x3dbaaf8f => 57
	i32 1044663988, ; 54: System.Linq.Expressions.dll => 0x3e444eb4 => 103
	i32 1082857460, ; 55: System.ComponentModel.TypeConverter => 0x408b17f4 => 96
	i32 1084122840, ; 56: Xamarin.Kotlin.StdLib => 0x409e66d8 => 88
	i32 1098259244, ; 57: System => 0x41761b2c => 124
	i32 1118262833, ; 58: ko\Microsoft.Maui.Controls.resources => 0x42a75631 => 16
	i32 1168523401, ; 59: pt\Microsoft.Maui.Controls.resources => 0x45a64089 => 22
	i32 1178241025, ; 60: Xamarin.AndroidX.Navigation.Runtime.dll => 0x463a8801 => 75
	i32 1203215381, ; 61: pl/Microsoft.Maui.Controls.resources.dll => 0x47b79c15 => 20
	i32 1234928153, ; 62: nb/Microsoft.Maui.Controls.resources.dll => 0x499b8219 => 18
	i32 1246548578, ; 63: Xamarin.AndroidX.Collection.Jvm.dll => 0x4a4cd262 => 60
	i32 1260983243, ; 64: cs\Microsoft.Maui.Controls.resources => 0x4b2913cb => 2
	i32 1292207520, ; 65: SQLitePCLRaw.core.dll => 0x4d0585a0 => 53
	i32 1293217323, ; 66: Xamarin.AndroidX.DrawerLayout.dll => 0x4d14ee2b => 65
	i32 1324164729, ; 67: System.Linq => 0x4eed2679 => 104
	i32 1373134921, ; 68: zh-Hans\Microsoft.Maui.Controls.resources => 0x51d86049 => 32
	i32 1376866003, ; 69: Xamarin.AndroidX.SavedState => 0x52114ed3 => 78
	i32 1406073936, ; 70: Xamarin.AndroidX.CoordinatorLayout => 0x53cefc50 => 61
	i32 1430672901, ; 71: ar\Microsoft.Maui.Controls.resources => 0x55465605 => 0
	i32 1437299793, ; 72: Xamarin.AndroidX.Lifecycle.Common.Jvm => 0x55ab7451 => 68
	i32 1441095154, ; 73: Xamarin.AndroidX.Lifecycle.ViewModel.Android => 0x55e55df2 => 70
	i32 1461004990, ; 74: es\Microsoft.Maui.Controls.resources => 0x57152abe => 6
	i32 1461234159, ; 75: System.Collections.Immutable.dll => 0x5718a9ef => 92
	i32 1462112819, ; 76: System.IO.Compression.dll => 0x57261233 => 102
	i32 1469204771, ; 77: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x57924923 => 58
	i32 1470490898, ; 78: Microsoft.Extensions.Primitives => 0x57a5e912 => 44
	i32 1479771757, ; 79: System.Collections.Immutable => 0x5833866d => 92
	i32 1480492111, ; 80: System.IO.Compression.Brotli.dll => 0x583e844f => 101
	i32 1493001747, ; 81: hi/Microsoft.Maui.Controls.resources.dll => 0x58fd6613 => 10
	i32 1514721132, ; 82: el/Microsoft.Maui.Controls.resources.dll => 0x5a48cf6c => 5
	i32 1524747670, ; 83: Plugin.LocalNotification => 0x5ae1cd96 => 50
	i32 1543031311, ; 84: System.Text.RegularExpressions.dll => 0x5bf8ca0f => 120
	i32 1551623176, ; 85: sk/Microsoft.Maui.Controls.resources.dll => 0x5c7be408 => 25
	i32 1622152042, ; 86: Xamarin.AndroidX.Loader.dll => 0x60b0136a => 72
	i32 1624863272, ; 87: Xamarin.AndroidX.ViewPager2 => 0x60d97228 => 82
	i32 1634654947, ; 88: CommunityToolkit.Maui.Core.dll => 0x616edae3 => 36
	i32 1636350590, ; 89: Xamarin.AndroidX.CursorAdapter => 0x6188ba7e => 63
	i32 1639515021, ; 90: System.Net.Http.dll => 0x61b9038d => 106
	i32 1639986890, ; 91: System.Text.RegularExpressions => 0x61c036ca => 120
	i32 1657153582, ; 92: System.Runtime => 0x62c6282e => 116
	i32 1658251792, ; 93: Xamarin.Google.Android.Material.dll => 0x62d6ea10 => 83
	i32 1677501392, ; 94: System.Net.Primitives.dll => 0x63fca3d0 => 107
	i32 1679769178, ; 95: System.Security.Cryptography => 0x641f3e5a => 117
	i32 1711441057, ; 96: SQLitePCLRaw.lib.e_sqlite3.android => 0x660284a1 => 54
	i32 1729485958, ; 97: Xamarin.AndroidX.CardView.dll => 0x6715dc86 => 59
	i32 1736233607, ; 98: ro/Microsoft.Maui.Controls.resources.dll => 0x677cd287 => 23
	i32 1743415430, ; 99: ca\Microsoft.Maui.Controls.resources => 0x67ea6886 => 1
	i32 1763938596, ; 100: System.Diagnostics.TraceSource.dll => 0x69239124 => 100
	i32 1766324549, ; 101: Xamarin.AndroidX.SwipeRefreshLayout => 0x6947f945 => 79
	i32 1770582343, ; 102: Microsoft.Extensions.Logging.dll => 0x6988f147 => 41
	i32 1780572499, ; 103: Mono.Android.Runtime.dll => 0x6a216153 => 128
	i32 1782862114, ; 104: ms\Microsoft.Maui.Controls.resources => 0x6a445122 => 17
	i32 1788241197, ; 105: Xamarin.AndroidX.Fragment => 0x6a96652d => 66
	i32 1793755602, ; 106: he\Microsoft.Maui.Controls.resources => 0x6aea89d2 => 9
	i32 1808609942, ; 107: Xamarin.AndroidX.Loader => 0x6bcd3296 => 72
	i32 1813058853, ; 108: Xamarin.Kotlin.StdLib.dll => 0x6c111525 => 88
	i32 1813201214, ; 109: Xamarin.Google.Android.Material => 0x6c13413e => 83
	i32 1818569960, ; 110: Xamarin.AndroidX.Navigation.UI.dll => 0x6c652ce8 => 76
	i32 1828688058, ; 111: Microsoft.Extensions.Logging.Abstractions.dll => 0x6cff90ba => 42
	i32 1842015223, ; 112: uk/Microsoft.Maui.Controls.resources.dll => 0x6dcaebf7 => 29
	i32 1853025655, ; 113: sv\Microsoft.Maui.Controls.resources => 0x6e72ed77 => 26
	i32 1858542181, ; 114: System.Linq.Expressions => 0x6ec71a65 => 103
	i32 1875935024, ; 115: fr\Microsoft.Maui.Controls.resources => 0x6fd07f30 => 8
	i32 1908813208, ; 116: Xamarin.GooglePlayServices.Basement => 0x71c62d98 => 85
	i32 1910275211, ; 117: System.Collections.NonGeneric.dll => 0x71dc7c8b => 93
	i32 1968388702, ; 118: Microsoft.Extensions.Configuration.dll => 0x75533a5e => 37
	i32 2003115576, ; 119: el\Microsoft.Maui.Controls.resources => 0x77651e38 => 5
	i32 2025202353, ; 120: ar/Microsoft.Maui.Controls.resources.dll => 0x78b622b1 => 0
	i32 2045470958, ; 121: System.Private.Xml => 0x79eb68ee => 112
	i32 2055257422, ; 122: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x7a80bd4e => 69
	i32 2066184531, ; 123: de\Microsoft.Maui.Controls.resources => 0x7b277953 => 4
	i32 2070888862, ; 124: System.Diagnostics.TraceSource => 0x7b6f419e => 100
	i32 2079903147, ; 125: System.Runtime.dll => 0x7bf8cdab => 116
	i32 2090596640, ; 126: System.Numerics.Vectors => 0x7c9bf920 => 109
	i32 2103459038, ; 127: SQLitePCLRaw.provider.e_sqlite3.dll => 0x7d603cde => 55
	i32 2127167465, ; 128: System.Console => 0x7ec9ffe9 => 98
	i32 2129483829, ; 129: Xamarin.GooglePlayServices.Base.dll => 0x7eed5835 => 84
	i32 2159891885, ; 130: Microsoft.Maui => 0x80bd55ad => 47
	i32 2169148018, ; 131: hu\Microsoft.Maui.Controls.resources => 0x814a9272 => 12
	i32 2181898931, ; 132: Microsoft.Extensions.Options.dll => 0x820d22b3 => 43
	i32 2192057212, ; 133: Microsoft.Extensions.Logging.Abstractions => 0x82a8237c => 42
	i32 2193016926, ; 134: System.ObjectModel.dll => 0x82b6c85e => 110
	i32 2201107256, ; 135: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x83323b38 => 89
	i32 2201231467, ; 136: System.Net.Http => 0x8334206b => 106
	i32 2207618523, ; 137: it\Microsoft.Maui.Controls.resources => 0x839595db => 14
	i32 2266799131, ; 138: Microsoft.Extensions.Configuration.Abstractions => 0x871c9c1b => 38
	i32 2270573516, ; 139: fr/Microsoft.Maui.Controls.resources.dll => 0x875633cc => 8
	i32 2279755925, ; 140: Xamarin.AndroidX.RecyclerView.dll => 0x87e25095 => 77
	i32 2303942373, ; 141: nb\Microsoft.Maui.Controls.resources => 0x89535ee5 => 18
	i32 2305521784, ; 142: System.Private.CoreLib.dll => 0x896b7878 => 126
	i32 2340441535, ; 143: System.Runtime.InteropServices.RuntimeInformation.dll => 0x8b804dbf => 113
	i32 2353062107, ; 144: System.Net.Primitives => 0x8c40e0db => 107
	i32 2368005991, ; 145: System.Xml.ReaderWriter.dll => 0x8d24e767 => 123
	i32 2371007202, ; 146: Microsoft.Extensions.Configuration => 0x8d52b2e2 => 37
	i32 2395872292, ; 147: id\Microsoft.Maui.Controls.resources => 0x8ece1c24 => 13
	i32 2427813419, ; 148: hi\Microsoft.Maui.Controls.resources => 0x90b57e2b => 10
	i32 2435356389, ; 149: System.Console.dll => 0x912896e5 => 98
	i32 2465273461, ; 150: SQLitePCLRaw.batteries_v2.dll => 0x92f11675 => 52
	i32 2471841756, ; 151: netstandard.dll => 0x93554fdc => 125
	i32 2475788418, ; 152: Java.Interop.dll => 0x93918882 => 127
	i32 2480646305, ; 153: Microsoft.Maui.Controls => 0x93dba8a1 => 45
	i32 2550873716, ; 154: hr\Microsoft.Maui.Controls.resources => 0x980b3e74 => 11
	i32 2570120770, ; 155: System.Text.Encodings.Web => 0x9930ee42 => 118
	i32 2593496499, ; 156: pl\Microsoft.Maui.Controls.resources => 0x9a959db3 => 20
	i32 2605712449, ; 157: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x9b500441 => 89
	i32 2617129537, ; 158: System.Private.Xml.dll => 0x9bfe3a41 => 112
	i32 2620871830, ; 159: Xamarin.AndroidX.CursorAdapter.dll => 0x9c375496 => 63
	i32 2626831493, ; 160: ja\Microsoft.Maui.Controls.resources => 0x9c924485 => 15
	i32 2663698177, ; 161: System.Runtime.Loader => 0x9ec4cf01 => 115
	i32 2732626843, ; 162: Xamarin.AndroidX.Activity => 0xa2e0939b => 56
	i32 2737747696, ; 163: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0xa32eb6f0 => 58
	i32 2752995522, ; 164: pt-BR\Microsoft.Maui.Controls.resources => 0xa41760c2 => 21
	i32 2758225723, ; 165: Microsoft.Maui.Controls.Xaml => 0xa4672f3b => 46
	i32 2764765095, ; 166: Microsoft.Maui.dll => 0xa4caf7a7 => 47
	i32 2766642685, ; 167: Xamarin.AndroidX.Lifecycle.ViewModel.Android.dll => 0xa4e79dfd => 70
	i32 2778768386, ; 168: Xamarin.AndroidX.ViewPager.dll => 0xa5a0a402 => 81
	i32 2780199943, ; 169: Xamarin.AndroidX.Lifecycle.Common.Jvm.dll => 0xa5b67c07 => 68
	i32 2785988530, ; 170: th\Microsoft.Maui.Controls.resources => 0xa60ecfb2 => 27
	i32 2801831435, ; 171: Microsoft.Maui.Graphics => 0xa7008e0b => 49
	i32 2806116107, ; 172: es/Microsoft.Maui.Controls.resources.dll => 0xa741ef0b => 6
	i32 2810250172, ; 173: Xamarin.AndroidX.CoordinatorLayout.dll => 0xa78103bc => 61
	i32 2823662805, ; 174: CapstoneMobileApp.dll => 0xa84dacd5 => 90
	i32 2831556043, ; 175: nl/Microsoft.Maui.Controls.resources.dll => 0xa8c61dcb => 19
	i32 2847418871, ; 176: Xamarin.GooglePlayServices.Base => 0xa9b829f7 => 84
	i32 2853208004, ; 177: Xamarin.AndroidX.ViewPager => 0xaa107fc4 => 81
	i32 2861189240, ; 178: Microsoft.Maui.Essentials => 0xaa8a4878 => 48
	i32 2868488919, ; 179: CommunityToolkit.Maui.Core => 0xaaf9aad7 => 36
	i32 2909740682, ; 180: System.Private.CoreLib => 0xad6f1e8a => 126
	i32 2916838712, ; 181: Xamarin.AndroidX.ViewPager2.dll => 0xaddb6d38 => 82
	i32 2919462931, ; 182: System.Numerics.Vectors.dll => 0xae037813 => 109
	i32 2933999366, ; 183: CapstoneMobileApp => 0xaee14706 => 90
	i32 2959614098, ; 184: System.ComponentModel.dll => 0xb0682092 => 97
	i32 2978675010, ; 185: Xamarin.AndroidX.DrawerLayout => 0xb18af942 => 65
	i32 3038032645, ; 186: _Microsoft.Android.Resource.Designer.dll => 0xb514b305 => 34
	i32 3057625584, ; 187: Xamarin.AndroidX.Navigation.Common => 0xb63fa9f0 => 73
	i32 3058099980, ; 188: Xamarin.GooglePlayServices.Tasks => 0xb646e70c => 87
	i32 3059408633, ; 189: Mono.Android.Runtime => 0xb65adef9 => 128
	i32 3059793426, ; 190: System.ComponentModel.Primitives => 0xb660be12 => 95
	i32 3077302341, ; 191: hu/Microsoft.Maui.Controls.resources.dll => 0xb76be845 => 12
	i32 3178803400, ; 192: Xamarin.AndroidX.Navigation.Fragment.dll => 0xbd78b0c8 => 74
	i32 3220365878, ; 193: System.Threading => 0xbff2e236 => 122
	i32 3230466174, ; 194: Xamarin.GooglePlayServices.Basement.dll => 0xc08d007e => 85
	i32 3258312781, ; 195: Xamarin.AndroidX.CardView => 0xc235e84d => 59
	i32 3286872994, ; 196: SQLite-net.dll => 0xc3e9b3a2 => 51
	i32 3305363605, ; 197: fi\Microsoft.Maui.Controls.resources => 0xc503d895 => 7
	i32 3316684772, ; 198: System.Net.Requests.dll => 0xc5b097e4 => 108
	i32 3317135071, ; 199: Xamarin.AndroidX.CustomView.dll => 0xc5b776df => 64
	i32 3346324047, ; 200: Xamarin.AndroidX.Navigation.Runtime => 0xc774da4f => 75
	i32 3357674450, ; 201: ru\Microsoft.Maui.Controls.resources => 0xc8220bd2 => 24
	i32 3358260929, ; 202: System.Text.Json => 0xc82afec1 => 119
	i32 3360279109, ; 203: SQLitePCLRaw.core => 0xc849ca45 => 53
	i32 3362522851, ; 204: Xamarin.AndroidX.Core => 0xc86c06e3 => 62
	i32 3366347497, ; 205: Java.Interop => 0xc8a662e9 => 127
	i32 3374999561, ; 206: Xamarin.AndroidX.RecyclerView => 0xc92a6809 => 77
	i32 3381016424, ; 207: da\Microsoft.Maui.Controls.resources => 0xc9863768 => 3
	i32 3428513518, ; 208: Microsoft.Extensions.DependencyInjection.dll => 0xcc5af6ee => 39
	i32 3430777524, ; 209: netstandard => 0xcc7d82b4 => 125
	i32 3463511458, ; 210: hr/Microsoft.Maui.Controls.resources.dll => 0xce70fda2 => 11
	i32 3471940407, ; 211: System.ComponentModel.TypeConverter.dll => 0xcef19b37 => 96
	i32 3476120550, ; 212: Mono.Android => 0xcf3163e6 => 129
	i32 3479583265, ; 213: ru/Microsoft.Maui.Controls.resources.dll => 0xcf663a21 => 24
	i32 3484440000, ; 214: ro\Microsoft.Maui.Controls.resources => 0xcfb055c0 => 23
	i32 3485117614, ; 215: System.Text.Json.dll => 0xcfbaacae => 119
	i32 3494395880, ; 216: Xamarin.GooglePlayServices.Location.dll => 0xd0483fe8 => 86
	i32 3580758918, ; 217: zh-HK\Microsoft.Maui.Controls.resources => 0xd56e0b86 => 31
	i32 3608519521, ; 218: System.Linq.dll => 0xd715a361 => 104
	i32 3624195450, ; 219: System.Runtime.InteropServices.RuntimeInformation => 0xd804d57a => 113
	i32 3641597786, ; 220: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0xd90e5f5a => 69
	i32 3643446276, ; 221: tr\Microsoft.Maui.Controls.resources => 0xd92a9404 => 28
	i32 3643854240, ; 222: Xamarin.AndroidX.Navigation.Fragment => 0xd930cda0 => 74
	i32 3657292374, ; 223: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd9fdda56 => 38
	i32 3672681054, ; 224: Mono.Android.dll => 0xdae8aa5e => 129
	i32 3697841164, ; 225: zh-Hant/Microsoft.Maui.Controls.resources.dll => 0xdc68940c => 33
	i32 3724971120, ; 226: Xamarin.AndroidX.Navigation.Common.dll => 0xde068c70 => 73
	i32 3748608112, ; 227: System.Diagnostics.DiagnosticSource => 0xdf6f3870 => 99
	i32 3754567612, ; 228: SQLitePCLRaw.provider.e_sqlite3 => 0xdfca27bc => 55
	i32 3792276235, ; 229: System.Collections.NonGeneric => 0xe2098b0b => 93
	i32 3817368567, ; 230: CommunityToolkit.Maui.dll => 0xe3886bf7 => 35
	i32 3823082795, ; 231: System.Security.Cryptography.dll => 0xe3df9d2b => 117
	i32 3841636137, ; 232: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xe4fab729 => 40
	i32 3849253459, ; 233: System.Runtime.InteropServices.dll => 0xe56ef253 => 114
	i32 3876362041, ; 234: SQLite-net => 0xe70c9739 => 51
	i32 3889960447, ; 235: zh-Hans/Microsoft.Maui.Controls.resources.dll => 0xe7dc15ff => 32
	i32 3896106733, ; 236: System.Collections.Concurrent.dll => 0xe839deed => 91
	i32 3896760992, ; 237: Xamarin.AndroidX.Core.dll => 0xe843daa0 => 62
	i32 3910130544, ; 238: Xamarin.AndroidX.Collection.Jvm => 0xe90fdb70 => 60
	i32 3921031405, ; 239: Xamarin.AndroidX.VersionedParcelable.dll => 0xe9b630ed => 80
	i32 3928044579, ; 240: System.Xml.ReaderWriter => 0xea213423 => 123
	i32 3931092270, ; 241: Xamarin.AndroidX.Navigation.UI => 0xea4fb52e => 76
	i32 3955647286, ; 242: Xamarin.AndroidX.AppCompat.dll => 0xebc66336 => 57
	i32 3967165417, ; 243: Xamarin.GooglePlayServices.Location => 0xec7623e9 => 86
	i32 3970018735, ; 244: Xamarin.GooglePlayServices.Tasks.dll => 0xeca1adaf => 87
	i32 3980434154, ; 245: th/Microsoft.Maui.Controls.resources.dll => 0xed409aea => 27
	i32 3987592930, ; 246: he/Microsoft.Maui.Controls.resources.dll => 0xedadd6e2 => 9
	i32 4025784931, ; 247: System.Memory => 0xeff49a63 => 105
	i32 4046471985, ; 248: Microsoft.Maui.Controls.Xaml.dll => 0xf1304331 => 46
	i32 4073602200, ; 249: System.Threading.dll => 0xf2ce3c98 => 122
	i32 4094352644, ; 250: Microsoft.Maui.Essentials.dll => 0xf40add04 => 48
	i32 4100113165, ; 251: System.Private.Uri => 0xf462c30d => 111
	i32 4102112229, ; 252: pt/Microsoft.Maui.Controls.resources.dll => 0xf48143e5 => 22
	i32 4125707920, ; 253: ms/Microsoft.Maui.Controls.resources.dll => 0xf5e94e90 => 17
	i32 4126470640, ; 254: Microsoft.Extensions.DependencyInjection => 0xf5f4f1f0 => 39
	i32 4150914736, ; 255: uk\Microsoft.Maui.Controls.resources => 0xf769eeb0 => 29
	i32 4182413190, ; 256: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0xf94a8f86 => 71
	i32 4213026141, ; 257: System.Diagnostics.DiagnosticSource.dll => 0xfb1dad5d => 99
	i32 4271975918, ; 258: Microsoft.Maui.Controls.dll => 0xfea12dee => 45
	i32 4292120959 ; 259: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xffd4917f => 71
], align 4

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [260 x i32] [
	i32 121, ; 0
	i32 33, ; 1
	i32 49, ; 2
	i32 114, ; 3
	i32 79, ; 4
	i32 30, ; 5
	i32 31, ; 6
	i32 97, ; 7
	i32 2, ; 8
	i32 30, ; 9
	i32 56, ; 10
	i32 15, ; 11
	i32 67, ; 12
	i32 54, ; 13
	i32 14, ; 14
	i32 121, ; 15
	i32 105, ; 16
	i32 34, ; 17
	i32 26, ; 18
	i32 94, ; 19
	i32 66, ; 20
	i32 124, ; 21
	i32 110, ; 22
	i32 13, ; 23
	i32 7, ; 24
	i32 50, ; 25
	i32 44, ; 26
	i32 41, ; 27
	i32 21, ; 28
	i32 35, ; 29
	i32 64, ; 30
	i32 19, ; 31
	i32 118, ; 32
	i32 80, ; 33
	i32 91, ; 34
	i32 1, ; 35
	i32 16, ; 36
	i32 4, ; 37
	i32 115, ; 38
	i32 52, ; 39
	i32 108, ; 40
	i32 102, ; 41
	i32 25, ; 42
	i32 43, ; 43
	i32 111, ; 44
	i32 101, ; 45
	i32 95, ; 46
	i32 28, ; 47
	i32 67, ; 48
	i32 94, ; 49
	i32 78, ; 50
	i32 40, ; 51
	i32 3, ; 52
	i32 57, ; 53
	i32 103, ; 54
	i32 96, ; 55
	i32 88, ; 56
	i32 124, ; 57
	i32 16, ; 58
	i32 22, ; 59
	i32 75, ; 60
	i32 20, ; 61
	i32 18, ; 62
	i32 60, ; 63
	i32 2, ; 64
	i32 53, ; 65
	i32 65, ; 66
	i32 104, ; 67
	i32 32, ; 68
	i32 78, ; 69
	i32 61, ; 70
	i32 0, ; 71
	i32 68, ; 72
	i32 70, ; 73
	i32 6, ; 74
	i32 92, ; 75
	i32 102, ; 76
	i32 58, ; 77
	i32 44, ; 78
	i32 92, ; 79
	i32 101, ; 80
	i32 10, ; 81
	i32 5, ; 82
	i32 50, ; 83
	i32 120, ; 84
	i32 25, ; 85
	i32 72, ; 86
	i32 82, ; 87
	i32 36, ; 88
	i32 63, ; 89
	i32 106, ; 90
	i32 120, ; 91
	i32 116, ; 92
	i32 83, ; 93
	i32 107, ; 94
	i32 117, ; 95
	i32 54, ; 96
	i32 59, ; 97
	i32 23, ; 98
	i32 1, ; 99
	i32 100, ; 100
	i32 79, ; 101
	i32 41, ; 102
	i32 128, ; 103
	i32 17, ; 104
	i32 66, ; 105
	i32 9, ; 106
	i32 72, ; 107
	i32 88, ; 108
	i32 83, ; 109
	i32 76, ; 110
	i32 42, ; 111
	i32 29, ; 112
	i32 26, ; 113
	i32 103, ; 114
	i32 8, ; 115
	i32 85, ; 116
	i32 93, ; 117
	i32 37, ; 118
	i32 5, ; 119
	i32 0, ; 120
	i32 112, ; 121
	i32 69, ; 122
	i32 4, ; 123
	i32 100, ; 124
	i32 116, ; 125
	i32 109, ; 126
	i32 55, ; 127
	i32 98, ; 128
	i32 84, ; 129
	i32 47, ; 130
	i32 12, ; 131
	i32 43, ; 132
	i32 42, ; 133
	i32 110, ; 134
	i32 89, ; 135
	i32 106, ; 136
	i32 14, ; 137
	i32 38, ; 138
	i32 8, ; 139
	i32 77, ; 140
	i32 18, ; 141
	i32 126, ; 142
	i32 113, ; 143
	i32 107, ; 144
	i32 123, ; 145
	i32 37, ; 146
	i32 13, ; 147
	i32 10, ; 148
	i32 98, ; 149
	i32 52, ; 150
	i32 125, ; 151
	i32 127, ; 152
	i32 45, ; 153
	i32 11, ; 154
	i32 118, ; 155
	i32 20, ; 156
	i32 89, ; 157
	i32 112, ; 158
	i32 63, ; 159
	i32 15, ; 160
	i32 115, ; 161
	i32 56, ; 162
	i32 58, ; 163
	i32 21, ; 164
	i32 46, ; 165
	i32 47, ; 166
	i32 70, ; 167
	i32 81, ; 168
	i32 68, ; 169
	i32 27, ; 170
	i32 49, ; 171
	i32 6, ; 172
	i32 61, ; 173
	i32 90, ; 174
	i32 19, ; 175
	i32 84, ; 176
	i32 81, ; 177
	i32 48, ; 178
	i32 36, ; 179
	i32 126, ; 180
	i32 82, ; 181
	i32 109, ; 182
	i32 90, ; 183
	i32 97, ; 184
	i32 65, ; 185
	i32 34, ; 186
	i32 73, ; 187
	i32 87, ; 188
	i32 128, ; 189
	i32 95, ; 190
	i32 12, ; 191
	i32 74, ; 192
	i32 122, ; 193
	i32 85, ; 194
	i32 59, ; 195
	i32 51, ; 196
	i32 7, ; 197
	i32 108, ; 198
	i32 64, ; 199
	i32 75, ; 200
	i32 24, ; 201
	i32 119, ; 202
	i32 53, ; 203
	i32 62, ; 204
	i32 127, ; 205
	i32 77, ; 206
	i32 3, ; 207
	i32 39, ; 208
	i32 125, ; 209
	i32 11, ; 210
	i32 96, ; 211
	i32 129, ; 212
	i32 24, ; 213
	i32 23, ; 214
	i32 119, ; 215
	i32 86, ; 216
	i32 31, ; 217
	i32 104, ; 218
	i32 113, ; 219
	i32 69, ; 220
	i32 28, ; 221
	i32 74, ; 222
	i32 38, ; 223
	i32 129, ; 224
	i32 33, ; 225
	i32 73, ; 226
	i32 99, ; 227
	i32 55, ; 228
	i32 93, ; 229
	i32 35, ; 230
	i32 117, ; 231
	i32 40, ; 232
	i32 114, ; 233
	i32 51, ; 234
	i32 32, ; 235
	i32 91, ; 236
	i32 62, ; 237
	i32 60, ; 238
	i32 80, ; 239
	i32 123, ; 240
	i32 76, ; 241
	i32 57, ; 242
	i32 86, ; 243
	i32 87, ; 244
	i32 27, ; 245
	i32 9, ; 246
	i32 105, ; 247
	i32 46, ; 248
	i32 122, ; 249
	i32 48, ; 250
	i32 111, ; 251
	i32 22, ; 252
	i32 17, ; 253
	i32 39, ; 254
	i32 29, ; 255
	i32 71, ; 256
	i32 99, ; 257
	i32 45, ; 258
	i32 71 ; 259
], align 4

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 4

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 4

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 0, ; id 0x0; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 4

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
	store ptr %fn, ptr @get_function_pointer, align 4, !tbaa !3
	ret void
}

; Strings
@.str.0 = private unnamed_addr constant [40 x i8] c"get_function_pointer MUST be specified\0A\00", align 1

;MarshalMethodName
@.MarshalMethodName.0_name = private unnamed_addr constant [1 x i8] c"\00", align 1

; External functions

; Function attributes: noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+armv7-a,+d32,+dsp,+fp64,+neon,+vfp2,+vfp2sp,+vfp3,+vfp3d16,+vfp3d16sp,+vfp3sp,-aes,-fp-armv8,-fp-armv8d16,-fp-armv8d16sp,-fp-armv8sp,-fp16,-fp16fml,-fullfp16,-sha2,-thumb-mode,-vfp4,-vfp4d16,-vfp4d16sp,-vfp4sp" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+armv7-a,+d32,+dsp,+fp64,+neon,+vfp2,+vfp2sp,+vfp3,+vfp3d16,+vfp3d16sp,+vfp3sp,-aes,-fp-armv8,-fp-armv8d16,-fp-armv8d16sp,-fp-armv8sp,-fp16,-fp16fml,-fullfp16,-sha2,-thumb-mode,-vfp4,-vfp4d16,-vfp4d16sp,-vfp4sp" }

; Metadata
!llvm.module.flags = !{!0, !1, !7}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.4xx @ df9aaf29a52042a4fbf800daf2f3a38964b9e958"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i32 1, !"min_enum_size", i32 4}
