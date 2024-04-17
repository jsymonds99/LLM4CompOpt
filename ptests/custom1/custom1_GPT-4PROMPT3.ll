; ModuleID = 'custom1_unoptimized.ll'
source_filename = "custom1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.main.as = private unnamed_addr constant [5 x i32] [i32 1, i32 6, i32 2, i32 9, i32 10], align 16
@__const.main.bs = private unnamed_addr constant [5 x i32] [i32 2, i32 3, i32 4, i32 5, i32 6], align 16
@.str = private unnamed_addr constant [19 x i8] c"%d choose %d = %d\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @recursive_factorial(i32 noundef %0) #0 {
  br label %tailrecurse

tailrecurse:                                      ; preds = %4, %1
  %accumulator.tr = phi i32 [ 1, %1 ], [ %6, %4 ]
  %.tr = phi i32 [ %0, %1 ], [ %5, %4 ]
  %2 = icmp eq i32 %.tr, 0
  br i1 %2, label %3, label %4

3:                                                ; preds = %tailrecurse
  br label %7

4:                                                ; preds = %tailrecurse
  %5 = add nsw i32 %.tr, -1
  %6 = mul nsw i32 %.tr, %accumulator.tr
  br label %tailrecurse

7:                                                ; preds = %3
  %accumulator.ret.tr = mul nsw i32 1, %accumulator.tr
  ret i32 %accumulator.ret.tr
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @normal_factorial(i32 noundef %0) #0 {
  %.not1 = icmp sgt i32 1, %0
  br i1 %.not1, label %7, label %.lr.ph

.lr.ph:                                           ; preds = %1
  br label %2

2:                                                ; preds = %.lr.ph, %2
  %3 = phi i32 [ 1, %.lr.ph ], [ %6, %2 ]
  %4 = phi i32 [ 1, %.lr.ph ], [ %5, %2 ]
  %5 = mul nsw i32 %4, %3
  %6 = add nsw i32 %3, 1
  %.not = icmp sgt i32 %6, %0
  br i1 %.not, label %._crit_edge, label %2, !llvm.loop !6

._crit_edge:                                      ; preds = %2
  %split = phi i32 [ %5, %2 ]
  br label %7

7:                                                ; preds = %._crit_edge, %1
  %.lcssa = phi i32 [ %split, %._crit_edge ], [ 1, %1 ]
  ret i32 %.lcssa
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @doing_something(i32 noundef %0, i32 noundef %1) #0 {
  %3 = icmp slt i32 0, %0
  br i1 %3, label %.lr.ph4, label %22

.lr.ph4:                                          ; preds = %2
  br label %4

4:                                                ; preds = %.lr.ph4, %19
  %5 = phi i32 [ 0, %.lr.ph4 ], [ %20, %19 ]
  %6 = phi i32 [ 0, %.lr.ph4 ], [ %.lcssa, %19 ]
  %7 = add nsw i32 %6, %5
  %8 = icmp slt i32 0, %1
  br i1 %8, label %.lr.ph, label %19

.lr.ph:                                           ; preds = %4
  br label %9

9:                                                ; preds = %.lr.ph, %9
  %10 = phi i32 [ 0, %.lr.ph ], [ %17, %9 ]
  %11 = phi i32 [ %7, %.lr.ph ], [ %16, %9 ]
  %12 = sub nsw i32 %11, %10
  %13 = tail call i32 @recursive_factorial(i32 noundef %5)
  %14 = tail call i32 @normal_factorial(i32 noundef %10)
  %15 = sub nsw i32 %13, %14
  %16 = add nsw i32 %12, %15
  %17 = add nsw i32 %10, 1
  %18 = icmp slt i32 %17, %1
  br i1 %18, label %9, label %._crit_edge, !llvm.loop !8

._crit_edge:                                      ; preds = %9
  %split = phi i32 [ %16, %9 ]
  br label %19

19:                                               ; preds = %._crit_edge, %4
  %.lcssa = phi i32 [ %split, %._crit_edge ], [ %7, %4 ]
  %20 = add nsw i32 %5, 1
  %21 = icmp slt i32 %20, %0
  br i1 %21, label %4, label %._crit_edge5, !llvm.loop !9

._crit_edge5:                                     ; preds = %19
  %split6 = phi i32 [ %.lcssa, %19 ]
  br label %22

22:                                               ; preds = %._crit_edge5, %2
  %.lcssa2 = phi i32 [ %split6, %._crit_edge5 ], [ 0, %2 ]
  ret i32 %.lcssa2
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 {
  br label %3

3:                                                ; preds = %2, %3
  %4 = phi i32 [ 0, %2 ], [ %12, %3 ]
  %5 = sext i32 %4 to i64
  %6 = getelementptr inbounds [5 x i32], ptr @__const.main.as, i64 0, i64 %5
  %7 = load i32, ptr %6, align 4
  %8 = getelementptr inbounds [5 x i32], ptr @__const.main.bs, i64 0, i64 %5
  %9 = load i32, ptr %8, align 4
  %10 = tail call i32 @doing_something(i32 noundef %7, i32 noundef %9)
  %11 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, i32 noundef %7, i32 noundef %9, i32 noundef %10) #3
  %12 = add nsw i32 %4, 1
  %13 = icmp slt i32 %12, 5
  br i1 %13, label %3, label %14, !llvm.loop !10

14:                                               ; preds = %3
  ret i32 0
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #1

declare i32 @printf(ptr noundef, ...) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind }

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
