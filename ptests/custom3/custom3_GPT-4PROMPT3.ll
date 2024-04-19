; ModuleID = 'custom3_unoptimized.ll'
source_filename = "custom3.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"%d\09\00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.2 = private unnamed_addr constant [18 x i8] c"Original Matrix:\0A\00", align 1
@.str.3 = private unnamed_addr constant [21 x i8] c"Manipulated Matrix:\0A\00", align 1
@str = private unnamed_addr constant [17 x i8] c"Original Matrix:\00", align 1
@str.1 = private unnamed_addr constant [20 x i8] c"Manipulated Matrix:\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @printMatrix(ptr noundef %0) #0 {
  br label %2

2:                                                ; preds = %16, %1
  %lsr.iv = phi ptr [ %scevgep, %16 ], [ %0, %1 ]
  %.01 = phi i32 [ %17, %16 ], [ 0, %1 ]
  %3 = icmp ult i32 %.01, 5
  br i1 %3, label %4, label %18

4:                                                ; preds = %2
  %5 = load i32, ptr %lsr.iv, align 4
  %6 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, i32 noundef %5) #4
  %scevgep3.1 = getelementptr i8, ptr %lsr.iv, i64 4
  %7 = load i32, ptr %scevgep3.1, align 4
  %8 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, i32 noundef %7) #4
  %scevgep3.2 = getelementptr i8, ptr %lsr.iv, i64 8
  %9 = load i32, ptr %scevgep3.2, align 4
  %10 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, i32 noundef %9) #4
  %scevgep3.3 = getelementptr i8, ptr %lsr.iv, i64 12
  %11 = load i32, ptr %scevgep3.3, align 4
  %12 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, i32 noundef %11) #4
  %scevgep3.4 = getelementptr i8, ptr %lsr.iv, i64 16
  %13 = load i32, ptr %scevgep3.4, align 4
  %14 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, i32 noundef %13) #4
  br i1 false, label %15, label %16

15:                                               ; preds = %4
  unreachable

16:                                               ; preds = %4
  %putchar5 = call i32 @putchar(i32 10)
  %17 = add nuw nsw i32 %.01, 1
  %scevgep = getelementptr i8, ptr %lsr.iv, i64 20
  br label %2, !llvm.loop !6

18:                                               ; preds = %2
  %putchar = call i32 @putchar(i32 10)
  ret void
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @manipulateMatrix(ptr noundef %0) #0 {
  br label %2

2:                                                ; preds = %271, %1
  %3 = phi i32 [ undef, %1 ], [ %30, %271 ]
  %4 = phi i32 [ undef, %1 ], [ %31, %271 ]
  %5 = phi i32 [ undef, %1 ], [ %32, %271 ]
  %6 = phi i32 [ undef, %1 ], [ %33, %271 ]
  %7 = phi i32 [ undef, %1 ], [ %34, %271 ]
  %8 = phi i32 [ undef, %1 ], [ %35, %271 ]
  %9 = phi i32 [ undef, %1 ], [ %36, %271 ]
  %10 = phi i32 [ undef, %1 ], [ %37, %271 ]
  %11 = phi i32 [ undef, %1 ], [ %38, %271 ]
  %12 = phi i32 [ undef, %1 ], [ %39, %271 ]
  %13 = phi i32 [ undef, %1 ], [ %40, %271 ]
  %14 = phi i32 [ undef, %1 ], [ %41, %271 ]
  %15 = phi i32 [ undef, %1 ], [ %42, %271 ]
  %16 = phi i32 [ undef, %1 ], [ %43, %271 ]
  %17 = phi i32 [ undef, %1 ], [ %44, %271 ]
  %18 = phi i32 [ undef, %1 ], [ %45, %271 ]
  %19 = phi i32 [ undef, %1 ], [ %46, %271 ]
  %20 = phi i32 [ undef, %1 ], [ %47, %271 ]
  %21 = phi i32 [ undef, %1 ], [ %48, %271 ]
  %22 = phi i32 [ undef, %1 ], [ %49, %271 ]
  %23 = phi i32 [ undef, %1 ], [ %50, %271 ]
  %24 = phi i32 [ undef, %1 ], [ %51, %271 ]
  %25 = phi i32 [ undef, %1 ], [ %52, %271 ]
  %26 = phi i32 [ undef, %1 ], [ %53, %271 ]
  %.01 = phi i32 [ 0, %1 ], [ %272, %271 ]
  %27 = icmp ult i32 %.01, 5
  br i1 %27, label %28, label %273

28:                                               ; preds = %2
  br label %29

29:                                               ; preds = %269, %28
  %30 = phi i32 [ %3, %28 ], [ %57, %269 ]
  %31 = phi i32 [ %4, %28 ], [ %58, %269 ]
  %32 = phi i32 [ %5, %28 ], [ %59, %269 ]
  %33 = phi i32 [ %6, %28 ], [ %60, %269 ]
  %34 = phi i32 [ %7, %28 ], [ %61, %269 ]
  %35 = phi i32 [ %8, %28 ], [ %62, %269 ]
  %36 = phi i32 [ %9, %28 ], [ %63, %269 ]
  %37 = phi i32 [ %10, %28 ], [ %64, %269 ]
  %38 = phi i32 [ %11, %28 ], [ %65, %269 ]
  %39 = phi i32 [ %12, %28 ], [ %66, %269 ]
  %40 = phi i32 [ %13, %28 ], [ %67, %269 ]
  %41 = phi i32 [ %14, %28 ], [ %68, %269 ]
  %42 = phi i32 [ %15, %28 ], [ %69, %269 ]
  %43 = phi i32 [ %16, %28 ], [ %70, %269 ]
  %44 = phi i32 [ %17, %28 ], [ %71, %269 ]
  %45 = phi i32 [ %18, %28 ], [ %72, %269 ]
  %46 = phi i32 [ %19, %28 ], [ %73, %269 ]
  %47 = phi i32 [ %20, %28 ], [ %74, %269 ]
  %48 = phi i32 [ %21, %28 ], [ %75, %269 ]
  %49 = phi i32 [ %22, %28 ], [ %76, %269 ]
  %50 = phi i32 [ %23, %28 ], [ %77, %269 ]
  %51 = phi i32 [ %24, %28 ], [ %78, %269 ]
  %52 = phi i32 [ %25, %28 ], [ %79, %269 ]
  %53 = phi i32 [ %26, %28 ], [ %80, %269 ]
  %.02 = phi i32 [ 0, %28 ], [ %270, %269 ]
  %54 = icmp ult i32 %.02, 5
  br i1 %54, label %55, label %271

55:                                               ; preds = %29
  br label %56

56:                                               ; preds = %267, %55
  %57 = phi i32 [ %30, %55 ], [ %89, %267 ]
  %58 = phi i32 [ %31, %55 ], [ %90, %267 ]
  %59 = phi i32 [ %32, %55 ], [ %91, %267 ]
  %60 = phi i32 [ %33, %55 ], [ %92, %267 ]
  %61 = phi i32 [ %34, %55 ], [ %93, %267 ]
  %62 = phi i32 [ %35, %55 ], [ %94, %267 ]
  %63 = phi i32 [ %36, %55 ], [ %95, %267 ]
  %64 = phi i32 [ %37, %55 ], [ %96, %267 ]
  %65 = phi i32 [ %38, %55 ], [ %97, %267 ]
  %66 = phi i32 [ %39, %55 ], [ %98, %267 ]
  %67 = phi i32 [ %40, %55 ], [ %99, %267 ]
  %68 = phi i32 [ %41, %55 ], [ %100, %267 ]
  %69 = phi i32 [ %42, %55 ], [ %101, %267 ]
  %70 = phi i32 [ %43, %55 ], [ %102, %267 ]
  %71 = phi i32 [ %44, %55 ], [ %103, %267 ]
  %72 = phi i32 [ %45, %55 ], [ %104, %267 ]
  %73 = phi i32 [ %46, %55 ], [ %105, %267 ]
  %74 = phi i32 [ %47, %55 ], [ %106, %267 ]
  %75 = phi i32 [ %48, %55 ], [ %107, %267 ]
  %76 = phi i32 [ %49, %55 ], [ %108, %267 ]
  %77 = phi i32 [ %50, %55 ], [ %109, %267 ]
  %78 = phi i32 [ %51, %55 ], [ %110, %267 ]
  %79 = phi i32 [ %52, %55 ], [ %111, %267 ]
  %80 = phi i32 [ %53, %55 ], [ %112, %267 ]
  %.03 = phi i32 [ 0, %55 ], [ %268, %267 ]
  %81 = icmp ult i32 %.03, 5
  br i1 %81, label %82, label %269

82:                                               ; preds = %56
  %83 = zext i32 %.01 to i64
  %84 = zext i32 %.02 to i64
  %85 = getelementptr inbounds [5 x i32], ptr %0, i64 %83, i64 %84
  %86 = load i32, ptr %85, align 4
  %87 = add nsw i32 %86, %.03
  store i32 %87, ptr %85, align 4
  br label %88

88:                                               ; preds = %266, %82
  %89 = phi i32 [ %57, %82 ], [ %242, %266 ]
  %90 = phi i32 [ %58, %82 ], [ %237, %266 ]
  %91 = phi i32 [ %59, %82 ], [ %232, %266 ]
  %92 = phi i32 [ %60, %82 ], [ %224, %266 ]
  %93 = phi i32 [ %61, %82 ], [ %221, %266 ]
  %94 = phi i32 [ %62, %82 ], [ %216, %266 ]
  %95 = phi i32 [ %63, %82 ], [ %211, %266 ]
  %96 = phi i32 [ %64, %82 ], [ %206, %266 ]
  %97 = phi i32 [ %65, %82 ], [ %198, %266 ]
  %98 = phi i32 [ %66, %82 ], [ %196, %266 ]
  %99 = phi i32 [ %67, %82 ], [ %191, %266 ]
  %100 = phi i32 [ %68, %82 ], [ %186, %266 ]
  %101 = phi i32 [ %69, %82 ], [ %181, %266 ]
  %102 = phi i32 [ %70, %82 ], [ %173, %266 ]
  %103 = phi i32 [ %71, %82 ], [ %170, %266 ]
  %104 = phi i32 [ %72, %82 ], [ %165, %266 ]
  %105 = phi i32 [ %73, %82 ], [ %160, %266 ]
  %106 = phi i32 [ %74, %82 ], [ %155, %266 ]
  %107 = phi i32 [ %75, %82 ], [ %147, %266 ]
  %108 = phi i32 [ %76, %82 ], [ %140, %266 ]
  %109 = phi i32 [ %77, %82 ], [ %135, %266 ]
  %110 = phi i32 [ %78, %82 ], [ %130, %266 ]
  %111 = phi i32 [ %79, %82 ], [ %125, %266 ]
  %112 = phi i32 [ %80, %82 ], [ %117, %266 ]
  %113 = phi i32 [ %87, %82 ], [ %247, %266 ]
  %.04 = phi i32 [ 0, %82 ], [ %116, %266 ]
  %114 = icmp ult i32 %.04, 5
  br i1 %114, label %115, label %267

115:                                              ; preds = %88
  %116 = add nuw nsw i32 %.04, 1
  %117 = mul nsw i32 %113, %116
  store i32 %117, ptr %85, align 4
  br i1 true, label %118, label %119

118:                                              ; preds = %115
  store i32 %117, ptr %85, align 4
  br label %120

119:                                              ; preds = %115
  br label %120

120:                                              ; preds = %119, %118
  br i1 false, label %123, label %121

121:                                              ; preds = %120
  %122 = add i32 %117, -1
  store i32 %122, ptr %85, align 4
  br label %124

123:                                              ; preds = %120
  br label %124

124:                                              ; preds = %123, %121
  %125 = phi i32 [ poison, %123 ], [ %122, %121 ]
  br i1 true, label %127, label %126

126:                                              ; preds = %124
  br label %129

127:                                              ; preds = %124
  %128 = add i32 %125, 2
  store i32 %128, ptr %85, align 4
  br label %129

129:                                              ; preds = %127, %126
  %130 = phi i32 [ %128, %127 ], [ poison, %126 ]
  br i1 false, label %133, label %131

131:                                              ; preds = %129
  %132 = add i32 %130, -3
  store i32 %132, ptr %85, align 4
  br label %134

133:                                              ; preds = %129
  br label %134

134:                                              ; preds = %133, %131
  %135 = phi i32 [ poison, %133 ], [ %132, %131 ]
  br i1 true, label %137, label %136

136:                                              ; preds = %134
  br label %139

137:                                              ; preds = %134
  %138 = add i32 %135, 4
  store i32 %138, ptr %85, align 4
  br label %139

139:                                              ; preds = %137, %136
  %140 = phi i32 [ %138, %137 ], [ poison, %136 ]
  br i1 false, label %..loopexit_crit_edge, label %145

..loopexit_crit_edge:                             ; preds = %139
  br label %.loopexit

.loopexitsplitsplitsplitsplit:                    ; preds = %246
  br label %.loopexitsplitsplitsplit

.loopexitsplitsplitsplit:                         ; preds = %.loopexitsplitsplitsplitsplit, %..loopexitsplitsplitsplit_crit_edge
  br label %.loopexitsplitsplit

.loopexitsplitsplit:                              ; preds = %.loopexitsplitsplitsplit, %..loopexitsplitsplit_crit_edge
  br label %.loopexitsplit

.loopexitsplit:                                   ; preds = %.loopexitsplitsplit, %..loopexitsplit_crit_edge
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexitsplit, %..loopexit_crit_edge
  br label %141

141:                                              ; preds = %.loopexit, %264
  br i1 false, label %143, label %142

142:                                              ; preds = %141
  br label %144

143:                                              ; preds = %141
  br label %144

144:                                              ; preds = %143, %142
  unreachable

145:                                              ; preds = %139
  %146 = add nuw nsw i32 %.01, %.02
  %147 = sub nsw i32 %140, %146
  store i32 %147, ptr %85, align 4
  br i1 true, label %149, label %148

148:                                              ; preds = %145
  br label %150

149:                                              ; preds = %145
  store i32 %147, ptr %85, align 4
  br label %150

150:                                              ; preds = %149, %148
  br i1 false, label %153, label %151

151:                                              ; preds = %150
  %152 = add i32 %147, -1
  store i32 %152, ptr %85, align 4
  br label %154

153:                                              ; preds = %150
  br label %154

154:                                              ; preds = %153, %151
  %155 = phi i32 [ poison, %153 ], [ %152, %151 ]
  br i1 true, label %157, label %156

156:                                              ; preds = %154
  br label %159

157:                                              ; preds = %154
  %158 = add i32 %155, 2
  store i32 %158, ptr %85, align 4
  br label %159

159:                                              ; preds = %157, %156
  %160 = phi i32 [ %158, %157 ], [ poison, %156 ]
  br i1 false, label %163, label %161

161:                                              ; preds = %159
  %162 = add i32 %160, -3
  store i32 %162, ptr %85, align 4
  br label %164

163:                                              ; preds = %159
  br label %164

164:                                              ; preds = %163, %161
  %165 = phi i32 [ poison, %163 ], [ %162, %161 ]
  br i1 true, label %167, label %166

166:                                              ; preds = %164
  br label %169

167:                                              ; preds = %164
  %168 = add i32 %165, 4
  store i32 %168, ptr %85, align 4
  br label %169

169:                                              ; preds = %167, %166
  %170 = phi i32 [ %168, %167 ], [ poison, %166 ]
  br i1 false, label %..loopexitsplit_crit_edge, label %171

..loopexitsplit_crit_edge:                        ; preds = %169
  br label %.loopexitsplit

171:                                              ; preds = %169
  %172 = shl nuw nsw i32 %146, 1
  %173 = sub nsw i32 %170, %172
  store i32 %173, ptr %85, align 4
  br i1 true, label %175, label %174

174:                                              ; preds = %171
  br label %176

175:                                              ; preds = %171
  store i32 %173, ptr %85, align 4
  br label %176

176:                                              ; preds = %175, %174
  br i1 false, label %179, label %177

177:                                              ; preds = %176
  %178 = add i32 %173, -1
  store i32 %178, ptr %85, align 4
  br label %180

179:                                              ; preds = %176
  br label %180

180:                                              ; preds = %179, %177
  %181 = phi i32 [ poison, %179 ], [ %178, %177 ]
  br i1 true, label %183, label %182

182:                                              ; preds = %180
  br label %185

183:                                              ; preds = %180
  %184 = add i32 %181, 2
  store i32 %184, ptr %85, align 4
  br label %185

185:                                              ; preds = %183, %182
  %186 = phi i32 [ %184, %183 ], [ poison, %182 ]
  br i1 false, label %189, label %187

187:                                              ; preds = %185
  %188 = add i32 %186, -3
  store i32 %188, ptr %85, align 4
  br label %190

189:                                              ; preds = %185
  br label %190

190:                                              ; preds = %189, %187
  %191 = phi i32 [ poison, %189 ], [ %188, %187 ]
  br i1 true, label %193, label %192

192:                                              ; preds = %190
  br label %195

193:                                              ; preds = %190
  %194 = add i32 %191, 4
  store i32 %194, ptr %85, align 4
  br label %195

195:                                              ; preds = %193, %192
  %196 = phi i32 [ %194, %193 ], [ poison, %192 ]
  br i1 false, label %..loopexitsplitsplit_crit_edge, label %197

..loopexitsplitsplit_crit_edge:                   ; preds = %195
  br label %.loopexitsplitsplit

197:                                              ; preds = %195
  %.neg = mul i32 %146, -3
  %198 = add i32 %.neg, %196
  store i32 %198, ptr %85, align 4
  br i1 true, label %200, label %199

199:                                              ; preds = %197
  br label %201

200:                                              ; preds = %197
  store i32 %198, ptr %85, align 4
  br label %201

201:                                              ; preds = %200, %199
  br i1 false, label %204, label %202

202:                                              ; preds = %201
  %203 = add i32 %198, -1
  store i32 %203, ptr %85, align 4
  br label %205

204:                                              ; preds = %201
  br label %205

205:                                              ; preds = %204, %202
  %206 = phi i32 [ poison, %204 ], [ %203, %202 ]
  br i1 true, label %208, label %207

207:                                              ; preds = %205
  br label %210

208:                                              ; preds = %205
  %209 = add i32 %206, 2
  store i32 %209, ptr %85, align 4
  br label %210

210:                                              ; preds = %208, %207
  %211 = phi i32 [ %209, %208 ], [ poison, %207 ]
  br i1 false, label %214, label %212

212:                                              ; preds = %210
  %213 = add i32 %211, -3
  store i32 %213, ptr %85, align 4
  br label %215

214:                                              ; preds = %210
  br label %215

215:                                              ; preds = %214, %212
  %216 = phi i32 [ poison, %214 ], [ %213, %212 ]
  br i1 true, label %218, label %217

217:                                              ; preds = %215
  br label %220

218:                                              ; preds = %215
  %219 = add i32 %216, 4
  store i32 %219, ptr %85, align 4
  br label %220

220:                                              ; preds = %218, %217
  %221 = phi i32 [ %219, %218 ], [ poison, %217 ]
  br i1 false, label %..loopexitsplitsplitsplit_crit_edge, label %222

..loopexitsplitsplitsplit_crit_edge:              ; preds = %220
  br label %.loopexitsplitsplitsplit

222:                                              ; preds = %220
  %223 = shl nsw i32 %146, 2
  %224 = sub nsw i32 %221, %223
  store i32 %224, ptr %85, align 4
  br i1 true, label %226, label %225

225:                                              ; preds = %222
  br label %227

226:                                              ; preds = %222
  store i32 %224, ptr %85, align 4
  br label %227

227:                                              ; preds = %226, %225
  br i1 false, label %230, label %228

228:                                              ; preds = %227
  %229 = add i32 %224, -1
  store i32 %229, ptr %85, align 4
  br label %231

230:                                              ; preds = %227
  br label %231

231:                                              ; preds = %230, %228
  %232 = phi i32 [ poison, %230 ], [ %229, %228 ]
  br i1 true, label %234, label %233

233:                                              ; preds = %231
  br label %236

234:                                              ; preds = %231
  %235 = add i32 %232, 2
  store i32 %235, ptr %85, align 4
  br label %236

236:                                              ; preds = %234, %233
  %237 = phi i32 [ %235, %234 ], [ poison, %233 ]
  br i1 false, label %240, label %238

238:                                              ; preds = %236
  %239 = add i32 %237, -3
  store i32 %239, ptr %85, align 4
  br label %241

240:                                              ; preds = %236
  br label %241

241:                                              ; preds = %240, %238
  %242 = phi i32 [ poison, %240 ], [ %239, %238 ]
  br i1 true, label %244, label %243

243:                                              ; preds = %241
  br label %246

244:                                              ; preds = %241
  %245 = add i32 %242, 4
  store i32 %245, ptr %85, align 4
  br label %246

246:                                              ; preds = %244, %243
  %247 = phi i32 [ %245, %244 ], [ poison, %243 ]
  br i1 false, label %.loopexitsplitsplitsplitsplit, label %248

248:                                              ; preds = %246
  br i1 false, label %249, label %266

249:                                              ; preds = %248
  br i1 true, label %251, label %250

250:                                              ; preds = %249
  br label %252

251:                                              ; preds = %249
  br label %252

252:                                              ; preds = %251, %250
  br i1 false, label %254, label %253

253:                                              ; preds = %252
  br label %255

254:                                              ; preds = %252
  br label %255

255:                                              ; preds = %254, %253
  br i1 true, label %257, label %256

256:                                              ; preds = %255
  br label %258

257:                                              ; preds = %255
  br label %258

258:                                              ; preds = %257, %256
  br i1 false, label %260, label %259

259:                                              ; preds = %258
  br label %261

260:                                              ; preds = %258
  br label %261

261:                                              ; preds = %260, %259
  br i1 true, label %263, label %262

262:                                              ; preds = %261
  br label %264

263:                                              ; preds = %261
  br label %264

264:                                              ; preds = %263, %262
  br i1 false, label %141, label %265

265:                                              ; preds = %264
  unreachable

266:                                              ; preds = %248
  br label %88, !llvm.loop !8

267:                                              ; preds = %88
  %268 = add nuw nsw i32 %.03, 1
  br label %56, !llvm.loop !9

269:                                              ; preds = %56
  %270 = add nuw nsw i32 %.02, 1
  br label %29, !llvm.loop !10

271:                                              ; preds = %29
  %272 = add nuw nsw i32 %.01, 1
  br label %2, !llvm.loop !11

273:                                              ; preds = %2
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca [5 x [5 x i32]], align 16
  br label %2

2:                                                ; preds = %16, %0
  %lsr.iv = phi ptr [ %scevgep, %16 ], [ %1, %0 ]
  %.01 = phi i32 [ %17, %16 ], [ 0, %0 ]
  %3 = icmp ult i32 %.01, 5
  br i1 %3, label %4, label %18

4:                                                ; preds = %2
  %5 = call i32 @rand() #4
  %6 = srem i32 %5, 10
  store i32 %6, ptr %lsr.iv, align 4
  %7 = call i32 @rand() #4
  %8 = srem i32 %7, 10
  %scevgep3.1 = getelementptr i8, ptr %lsr.iv, i64 4
  store i32 %8, ptr %scevgep3.1, align 4
  %9 = call i32 @rand() #4
  %10 = srem i32 %9, 10
  %scevgep3.2 = getelementptr i8, ptr %lsr.iv, i64 8
  store i32 %10, ptr %scevgep3.2, align 4
  %11 = call i32 @rand() #4
  %12 = srem i32 %11, 10
  %scevgep3.3 = getelementptr i8, ptr %lsr.iv, i64 12
  store i32 %12, ptr %scevgep3.3, align 4
  %13 = call i32 @rand() #4
  %14 = srem i32 %13, 10
  %scevgep3.4 = getelementptr i8, ptr %lsr.iv, i64 16
  store i32 %14, ptr %scevgep3.4, align 4
  br i1 false, label %15, label %16

15:                                               ; preds = %4
  unreachable

16:                                               ; preds = %4
  %17 = add nuw nsw i32 %.01, 1
  %scevgep = getelementptr i8, ptr %lsr.iv, i64 20
  br label %2, !llvm.loop !12

18:                                               ; preds = %2
  %puts = call i32 @puts(ptr nonnull dereferenceable(1) @str)
  call void @printMatrix(ptr noundef nonnull %1)
  call void @manipulateMatrix(ptr noundef nonnull %1)
  %puts5 = call i32 @puts(ptr nonnull dereferenceable(1) @str.1)
  call void @printMatrix(ptr noundef nonnull %1)
  ret i32 0
}

; Function Attrs: nounwind
declare i32 @rand() #2

; Function Attrs: nofree nounwind
declare noundef i32 @putchar(i32 noundef) #3

; Function Attrs: nofree nounwind
declare noundef i32 @puts(ptr nocapture noundef readonly) #3

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nofree nounwind }
attributes #4 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"clang version 17.0.6"}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
!8 = distinct !{!8, !7}
!9 = distinct !{!9, !7}
!10 = distinct !{!10, !7}
!11 = distinct !{!11, !7}
!12 = distinct !{!12, !7}
