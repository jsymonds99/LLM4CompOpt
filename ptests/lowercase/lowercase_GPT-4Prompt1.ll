; ModuleID = 'lowercase_unoptimized.ll'
source_filename = "lowercase.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticData = internal global [16 x i16] [i16 72, i16 69, i16 76, i16 76, i16 79, i16 32, i16 87, i16 79, i16 82, i16 76, i16 68, i16 33, i16 72, i16 69, i16 76, i16 76], align 16
@.str = private unnamed_addr constant [29 x i8] c"iterations (%ld characters)\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 {
  %3 = icmp ult i64 0, 32
  br i1 %3, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %2, %.lr.ph
  %.0 = phi i64 [ %4, %.lr.ph ], [ 0, %2 ]
  call void @doTest(i64 noundef %.0)
  %4 = add i64 %.0, 1
  %5 = icmp ult i64 %4, 32
  br i1 %5, label %.lr.ph, label %._crit_edge, !llvm.loop !6

._crit_edge:                                      ; preds = %.lr.ph, %2
  ret i32 0
}

; Function Attrs: noinline nounwind uwtable
define internal void @doTest(i64 noundef %0) #0 {
  %2 = add i64 %0, 16
  %3 = sub i64 %2, 1
  %4 = udiv i64 %3, 16
  %5 = mul i64 %4, 16
  %6 = mul i64 2, %5
  %7 = call ptr @malloc(i64 noundef %6) #5
  %8 = icmp ult i64 0, %5
  br i1 %8, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %1, %.lr.ph
  %.0 = phi i64 [ %10, %.lr.ph ], [ 0, %1 ]
  %9 = getelementptr inbounds i16, ptr %7, i64 %.0
  call void @llvm.memcpy.p0.p0.i64(ptr align 2 %9, ptr align 16 @staticData, i64 32, i1 false)
  %10 = add i64 %.0, 16
  %11 = icmp ult i64 %10, %5
  br i1 %11, label %.lr.ph, label %._crit_edge, !llvm.loop !8

._crit_edge:                                      ; preds = %.lr.ph, %1
  %12 = mul i64 2, %5
  %13 = call ptr @malloc(i64 noundef %12) #5
  %14 = call i32 (ptr, ...) @printf(ptr noundef @.str, i64 noundef %0, i64 noundef %0)
  %15 = mul i64 2, %5
  call void @llvm.memset.p0.i64(ptr align 2 %13, i8 0, i64 %15, i1 false)
  %16 = icmp ult i64 0, 10000000
  br i1 %16, label %.lr.ph2, label %._crit_edge3

.lr.ph2:                                          ; preds = %._crit_edge, %.lr.ph2
  %.1 = phi i64 [ %18, %.lr.ph2 ], [ 0, %._crit_edge ]
  %17 = call i64 @lower_StringImpl(ptr noundef %7, i64 noundef %0, ptr noundef %13)
  %18 = add i64 %.1, 1
  %19 = icmp ult i64 %18, 10000000
  br i1 %19, label %.lr.ph2, label %._crit_edge3, !llvm.loop !9

._crit_edge3:                                     ; preds = %.lr.ph2, %._crit_edge
  ret void
}

; Function Attrs: allocsize(0)
declare ptr @malloc(i64 noundef) #1

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #2

declare i32 @printf(ptr noundef, ...) #3

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: noinline nounwind uwtable
define internal i64 @lower_StringImpl(ptr noalias noundef %0, i64 noundef %1, ptr noalias noundef %2) #0 {
  %4 = icmp ult i64 0, %1
  br i1 %4, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %3, %.lr.ph
  %.02 = phi i16 [ %10, %.lr.ph ], [ 0, %3 ]
  %.01 = phi i64 [ %13, %.lr.ph ], [ 0, %3 ]
  %5 = getelementptr inbounds i16, ptr %0, i64 %.01
  %6 = load i16, ptr %5, align 2
  %7 = zext i16 %6 to i32
  %8 = zext i16 %.02 to i32
  %9 = or i32 %8, %7
  %10 = trunc i32 %9 to i16
  %11 = call zeroext i16 @toASCIILower(i16 noundef zeroext %6)
  %12 = getelementptr inbounds i16, ptr %2, i64 %.01
  store i16 %11, ptr %12, align 2
  %13 = add i64 %.01, 1
  %14 = icmp ult i64 %13, %1
  br i1 %14, label %.lr.ph, label %._crit_edge, !llvm.loop !10

._crit_edge:                                      ; preds = %.lr.ph, %3
  %.1 = phi i16 [ 0, %3 ], [ %10, %.lr.ph ]
  %15 = zext i16 %.1 to i32
  %16 = and i32 %15, -128
  %17 = icmp ne i32 %16, 0
  %. = select i1 %17, i64 0, i64 1
  ret i64 %.
}

; Function Attrs: noinline nounwind uwtable
define internal zeroext i16 @toASCIILower(i16 noundef zeroext %0) #0 {
  %2 = zext i16 %0 to i32
  %3 = zext i16 %0 to i32
  %4 = icmp sge i32 %3, 65
  %5 = zext i16 %0 to i32
  %6 = icmp sle i32 %5, 90
  %7 = select i1 %4, i1 %6, i1 false
  %8 = zext i1 %7 to i32
  %9 = shl i32 %8, 5
  %10 = or i32 %2, %9
  %11 = trunc i32 %10 to i16
  ret i16 %11
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #5 = { allocsize(0) }

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
