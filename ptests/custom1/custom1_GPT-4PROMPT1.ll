; ModuleID = 'custom1_unoptimized.ll'
source_filename = "custom1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.main.as = private unnamed_addr constant [5 x i32] [i32 1, i32 6, i32 2, i32 9, i32 10], align 16
@__const.main.bs = private unnamed_addr constant [5 x i32] [i32 2, i32 3, i32 4, i32 5, i32 6], align 16
@.str = private unnamed_addr constant [19 x i8] c"%d choose %d = %d\0A\00", align 1

; Function Attrs: nofree noinline nosync nounwind memory(none) uwtable
define dso_local i32 @recursive_factorial(i32 noundef %0) local_unnamed_addr #0 {
  %2 = icmp eq i32 %0, 0
  br i1 %2, label %3, label %4

3:                                                ; preds = %1
  br label %8

4:                                                ; preds = %1
  %5 = sub nsw i32 %0, 1
  %6 = tail call i32 @recursive_factorial(i32 noundef %5)
  %7 = mul nsw i32 %0, %6
  br label %8

8:                                                ; preds = %4, %3
  %.0 = phi i32 [ 1, %3 ], [ %7, %4 ]
  ret i32 %.0
}

; Function Attrs: nofree noinline norecurse nosync nounwind memory(none) uwtable
define dso_local i32 @normal_factorial(i32 noundef %0) local_unnamed_addr #1 {
  %2 = icmp sle i32 1, %0
  br i1 %2, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %1, %.lr.ph
  %.01 = phi i32 [ 1, %1 ], [ %3, %.lr.ph ]
  %.0 = phi i32 [ 1, %1 ], [ %4, %.lr.ph ]
  %3 = mul nsw i32 %.01, %.0
  %4 = add nsw i32 %.0, 1
  %5 = icmp sle i32 %4, %0
  br i1 %5, label %.lr.ph, label %._crit_edge, !llvm.loop !6

._crit_edge:                                      ; preds = %.lr.ph, %1
  %.1 = phi i32 [ %3, %.lr.ph ], [ 1, %1 ]
  ret i32 %.1
}

; Function Attrs: nofree noinline nosync nounwind memory(none) uwtable
define dso_local i32 @doing_something(i32 noundef %0, i32 noundef %1) local_unnamed_addr #0 {
  %3 = icmp slt i32 0, %0
  br i1 %3, label %.lr.ph2, label %._crit_edge3

.lr.ph2:                                          ; preds = %2, %._crit_edge
  %.05 = phi i32 [ 0, %2 ], [ %.2, %._crit_edge ]
  %.04 = phi i32 [ 0, %2 ], [ %13, %._crit_edge ]
  %4 = add nsw i32 %.05, %.04
  %5 = icmp slt i32 0, %1
  br i1 %5, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %.lr.ph2, %.lr.ph
  %.1 = phi i32 [ %4, %.lr.ph2 ], [ %10, %.lr.ph ]
  %.0 = phi i32 [ 0, %.lr.ph2 ], [ %11, %.lr.ph ]
  %6 = sub nsw i32 %.1, %.0
  %7 = tail call i32 @recursive_factorial(i32 noundef %.04)
  %8 = tail call i32 @normal_factorial(i32 noundef %.0)
  %9 = sub nsw i32 %7, %8
  %10 = add nsw i32 %6, %9
  %11 = add nsw i32 %.0, 1
  %12 = icmp slt i32 %11, %1
  br i1 %12, label %.lr.ph, label %._crit_edge, !llvm.loop !8

._crit_edge:                                      ; preds = %.lr.ph2, %.lr.ph
  %.2 = phi i32 [ %10, %.lr.ph ], [ %4, %.lr.ph2 ]
  %13 = add nsw i32 %.04, 1
  %14 = icmp slt i32 %13, %0
  br i1 %14, label %.lr.ph2, label %._crit_edge3, !llvm.loop !9

._crit_edge3:                                     ; preds = %._crit_edge, %2
  %.3 = phi i32 [ %.2, %._crit_edge ], [ 0, %2 ]
  ret i32 %.3
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) local_unnamed_addr #2 {
  %3 = alloca [5 x i32], align 16
  %4 = alloca [5 x i32], align 16
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %3, ptr align 16 @__const.main.as, i64 20, i1 false)
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %4, ptr align 16 @__const.main.bs, i64 20, i1 false)
  %5 = icmp slt i32 0, 5
  br i1 %5, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %2, %.lr.ph
  %.0 = phi i32 [ 0, %2 ], [ %20, %.lr.ph ]
  %6 = sext i32 %.0 to i64
  %7 = getelementptr inbounds [5 x i32], ptr %3, i64 0, i64 %6
  %8 = load i32, ptr %7, align 4
  %9 = sext i32 %.0 to i64
  %10 = getelementptr inbounds [5 x i32], ptr %4, i64 0, i64 %9
  %11 = load i32, ptr %10, align 4
  %12 = sext i32 %.0 to i64
  %13 = getelementptr inbounds [5 x i32], ptr %3, i64 0, i64 %12
  %14 = load i32, ptr %13, align 4
  %15 = sext i32 %.0 to i64
  %16 = getelementptr inbounds [5 x i32], ptr %4, i64 0, i64 %15
  %17 = load i32, ptr %16, align 4
  %18 = tail call i32 @doing_something(i32 noundef %14, i32 noundef %17)
  %19 = tail call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %8, i32 noundef %11, i32 noundef %18)
  %20 = add nsw i32 %.0, 1
  %21 = icmp slt i32 %20, 5
  br i1 %21, label %.lr.ph, label %._crit_edge, !llvm.loop !10

._crit_edge:                                      ; preds = %.lr.ph, %2
  ret i32 0
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #3

declare i32 @printf(ptr noundef, ...) local_unnamed_addr #4

attributes #0 = { nofree noinline nosync nounwind memory(none) uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree noinline norecurse nosync nounwind memory(none) uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

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
