; ModuleID = 'custom1_unoptimized.ll'
source_filename = "custom1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.main.as = private unnamed_addr constant [5 x i32] [i32 1, i32 6, i32 2, i32 9, i32 10], align 16
@__const.main.bs = private unnamed_addr constant [5 x i32] [i32 2, i32 3, i32 4, i32 5, i32 6], align 16
@.str = private unnamed_addr constant [19 x i8] c"%d choose %d = %d\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @recursive_factorial(i32 noundef %0) local_unnamed_addr #0 {
  %2 = icmp eq i32 %0, 0
  br i1 %2, label %7, label %3

3:                                                ; preds = %1
  %4 = add nsw i32 %0, -1
  %5 = call i32 @recursive_factorial(i32 noundef %4)
  %6 = mul nsw i32 %5, %0
  br label %7

7:                                                ; preds = %1, %3
  %8 = phi i32 [ %6, %3 ], [ 1, %1 ]
  ret i32 %8
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @normal_factorial(i32 noundef %0) local_unnamed_addr #0 {
  %2 = icmp sgt i32 %0, 0
  br i1 %2, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %1, %.lr.ph
  %3 = phi i32 [ %6, %.lr.ph ], [ 1, %1 ]
  %4 = phi i32 [ %5, %.lr.ph ], [ 1, %1 ]
  %5 = mul nsw i32 %4, %3
  %6 = add nuw nsw i32 %3, 1
  %7 = sub i32 %6, %0
  %exitcond.not = icmp eq i32 %7, 1
  br i1 %exitcond.not, label %._crit_edge, label %.lr.ph, !llvm.loop !6

._crit_edge:                                      ; preds = %.lr.ph, %1
  %.lcssa = phi i32 [ 1, %1 ], [ %5, %.lr.ph ]
  ret i32 %.lcssa
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @doing_something(i32 noundef %0, i32 noundef %1) local_unnamed_addr #0 {
  %3 = icmp sgt i32 %0, 0
  br i1 %3, label %.lr.ph3, label %._crit_edge4

.lr.ph3:                                          ; preds = %2, %._crit_edge
  %4 = phi i32 [ %16, %._crit_edge ], [ 0, %2 ]
  %5 = phi i32 [ %.lcssa, %._crit_edge ], [ 0, %2 ]
  %6 = add nsw i32 %5, %4
  %7 = icmp sgt i32 %1, 0
  br i1 %7, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %.lr.ph3, %.lr.ph
  %8 = phi i32 [ %14, %.lr.ph ], [ %6, %.lr.ph3 ]
  %9 = phi i32 [ %15, %.lr.ph ], [ 0, %.lr.ph3 ]
  %10 = sub nsw i32 %8, %9
  %11 = call i32 @recursive_factorial(i32 noundef %4)
  %12 = call i32 @normal_factorial(i32 noundef %9)
  %13 = sub nsw i32 %11, %12
  %14 = add nsw i32 %13, %10
  %15 = add nuw nsw i32 %9, 1
  %exitcond.not = icmp eq i32 %15, %1
  br i1 %exitcond.not, label %._crit_edge, label %.lr.ph, !llvm.loop !8

._crit_edge:                                      ; preds = %.lr.ph, %.lr.ph3
  %.lcssa = phi i32 [ %6, %.lr.ph3 ], [ %14, %.lr.ph ]
  %16 = add nuw nsw i32 %4, 1
  %exitcond6.not = icmp eq i32 %16, %0
  br i1 %exitcond6.not, label %._crit_edge4, label %.lr.ph3, !llvm.loop !9

._crit_edge4:                                     ; preds = %._crit_edge, %2
  %.lcssa1 = phi i32 [ 0, %2 ], [ %.lcssa, %._crit_edge ]
  ret i32 %.lcssa1
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) local_unnamed_addr #0 {
  br label %3

3:                                                ; preds = %2, %3
  %indvars.iv = phi i64 [ 0, %2 ], [ %indvars.iv.next, %3 ]
  %4 = shl nuw nsw i64 %indvars.iv, 2
  %scevgep = getelementptr i8, ptr @__const.main.as, i64 %4
  %5 = load i32, ptr %scevgep, align 4
  %6 = shl nuw nsw i64 %indvars.iv, 2
  %scevgep2 = getelementptr i8, ptr @__const.main.bs, i64 %6
  %7 = load i32, ptr %scevgep2, align 4
  %8 = call i32 @doing_something(i32 noundef %5, i32 noundef %7)
  %9 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, i32 noundef %5, i32 noundef %7, i32 noundef %8) #3
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, 5
  br i1 %exitcond.not, label %10, label %3, !llvm.loop !10

10:                                               ; preds = %3
  ret i32 0
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #1

declare i32 @printf(ptr noundef, ...) local_unnamed_addr #2

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
